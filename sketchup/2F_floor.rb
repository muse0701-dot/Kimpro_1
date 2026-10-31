# 2F 바닥 슬래브 자동 생성 스크립트 (SketchUp 2017+)
# 사용법:
#   1) 2F 객체(벽 그룹 등)를 선택한다. 선택이 없으면 이름/태그에 '2F' 또는 '2층'이 들어간 객체를 찾는다.
#   2) Extensions > Developer > Ruby Console 에 이 파일 내용을 붙여넣고 Enter.
#   3) 결과가 마음에 들지 않으면 Ctrl+Z 한 번으로 되돌린다.
module KimMadam
  module Floor2F
    THICKNESS = 200.mm   # 슬래브 두께
    TOL       = 10.mm    # 바닥 레벨 판정 허용 오차
    PATTERN   = /2F|2층/i
    MAT_NAME  = '2F_바닥'

    def self.targets(model)
      sel = model.selection.to_a
      return sel unless sel.empty?
      model.active_entities.select do |e|
        names = []
        names << e.name if e.respond_to?(:name)
        names << e.definition.name if e.respond_to?(:definition)
        names << e.layer.name if e.layer
        names.any? { |n| n =~ PATTERN }
      end
    end

    # 그룹/컴포넌트 안까지 들어가 모든 선분을 월드 좌표로 모은다
    def self.collect(ents, tr, out)
      ents.each do |e|
        case e
        when Sketchup::Edge
          out << [e.start.position.transform(tr), e.end.position.transform(tr)]
        when Sketchup::Group, Sketchup::ComponentInstance
          collect(e.definition.entities, tr * e.transformation, out)
        end
      end
    end

    def self.run
      model = Sketchup.active_model
      items = targets(model)
      if items.empty?
        UI.messagebox("2F 객체를 선택하거나, 이름/태그에 '2F'가 들어간 그룹을 준비해 주세요.")
        return
      end

      segs = []
      collect(items, Geom::Transformation.new, segs)
      if segs.empty?
        UI.messagebox('선택한 객체 안에 선(Edge)이 없어요.')
        return
      end

      # 2F의 가장 낮은 레벨 = 벽 하단 = 바닥 상단
      z0   = segs.flatten.map(&:z).min
      base = segs.select { |a, b| (a.z - z0).abs <= TOL && (b.z - z0).abs <= TOL }

      model.start_operation('2F 바닥 생성', true)
      grp = model.active_entities.add_group
      grp.name = MAT_NAME
      ents = grp.entities

      base.each do |a, b|
        p1 = Geom::Point3d.new(a.x, a.y, z0)
        p2 = Geom::Point3d.new(b.x, b.y, z0)
        ents.add_line(p1, p2) unless p1 == p2
      end
      ents.grep(Sketchup::Edge).each(&:find_faces)

      # 벽 단면과 실 내부 면을 하나로 합쳐 외곽선 기준 슬래브로 만든다
      inner = ents.grep(Sketchup::Edge).select { |e| e.faces.size == 2 }
      ents.erase_entities(inner) unless inner.empty?
      loose = ents.grep(Sketchup::Edge).select { |e| e.faces.empty? }
      ents.erase_entities(loose) unless loose.empty?

      faces = ents.grep(Sketchup::Face)
      if faces.empty?
        # 닫힌 외곽선이 없으면 2F 전체 범위의 사각 슬래브로 대체
        bb = Geom::BoundingBox.new
        segs.each { |a, b| bb.add(a, b) }
        ents.clear!
        faces = [ents.add_face([bb.min.x, bb.min.y, z0], [bb.max.x, bb.min.y, z0],
                               [bb.max.x, bb.max.y, z0], [bb.min.x, bb.max.y, z0])]
        fallback = true
      end

      faces.each do |f|
        f.reverse! if f.normal.z > 0   # 법선을 아래로 → 아래 방향으로 두께 생성
        f.pushpull(THICKNESS)
      end

      mat = model.materials[MAT_NAME] || model.materials.add(MAT_NAME)
      mat.color = Sketchup::Color.new(200, 190, 175)
      grp.material = mat
      model.commit_operation

      msg = "2F 바닥 생성 완료\n레벨: #{z0.to_mm.round} mm / 두께: #{THICKNESS.to_mm.round} mm"
      msg += "\n(닫힌 외곽선을 찾지 못해 전체 범위 사각형으로 만들었어요)" if fallback
      UI.messagebox(msg)
    rescue => err
      model.abort_operation if model
      UI.messagebox("오류: #{err.message}")
    end
  end
end

KimMadam::Floor2F.run
