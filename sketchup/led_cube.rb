# 천장 행잉 LED 도트 큐브 조형물 (SketchUp 2017+)
# - 16×16×16 = 4,096개 LED 도트, 피치 150mm, 천장 프레임에 케이블로 매달린 구조
# - 연출: 컬러 구(sphere) / 무지개 / 파도 / 텍스트(한글 가능, 스크롤) / 픽토그램(하트·사람·화살표)
# 사용법: Ruby Console에 load 하거나 붙여넣기 → 자동 생성 후 정지 화면 표시
#   KimMadam::LedCube.play(:demo)            데모 연속 재생
#   KimMadam::LedCube.play(:text, '김마담')   텍스트 스크롤
#   KimMadam::LedCube.play(:heart)           픽토그램 (:heart / :person / :arrow)
#   KimMadam::LedCube.play(:sphere)          (:rainbow / :wave 도 가능)
#   KimMadam::LedCube.stop                   정지
#   메뉴: 확장 프로그램 > LED 큐브
module KimMadam
  module LedCube
    N         = 16      # 한 변 LED 개수
    PITCH     = 150     # LED 간격 (mm)
    LED_D     = 40      # LED 도트 지름 (mm)
    CEIL_H    = 6000    # 천장 높이 (mm)
    BOTTOM_H  = 2700    # 최하단 LED 높이 (mm)
    FRAME_GAP = 300     # 최상단 LED ~ 프레임 하단 (mm)
    FPS       = 5
    ROOT      = 'LED 큐브 조형물'

    PICTO = {
      heart: %w[
        ................
        ................
        ..####....####..
        .######..######.
        ################
        ################
        ################
        .##############.
        ..############..
        ...##########...
        ....########....
        .....######.....
        ......####......
        .......##.......
        ................
        ................
      ],
      person: %w[
        ......####......
        ......####......
        ......####......
        ................
        ....########....
        ...##########...
        ..###.####.###..
        ..##..####..##..
        ..##..####..##..
        ......####......
        ......#..#......
        .....##..##.....
        .....##..##.....
        .....##..##.....
        .....##..##.....
        ................
      ],
      arrow: %w[
        ................
        ................
        ................
        .........#......
        .........##.....
        .........###....
        .###########....
        .############...
        .#############..
        .############...
        .###########....
        .........###....
        .........##.....
        .........#......
        ................
        ................
      ]
    }

    # ---------- 색상 ----------
    def self.hsv(h, s, v)
      i = (h * 6).floor
      f = h * 6 - i
      p = v * (1 - s)
      q = v * (1 - f * s)
      t = v * (1 - (1 - f) * s)
      r, g, b = [[v, t, p], [q, v, p], [p, v, t], [p, q, v], [t, p, v], [v, p, q]][i % 6]
      [(r * 255).round, (g * 255).round, (b * 255).round]
    end

    # 연출 모드별 LED (i: X, j: Y 깊이, k: 높이) 색상. nil = 꺼짐
    def self.color(mode, t, i, j, k, data)
      c = (N - 1) / 2.0
      case mode
      when :rainbow
        hsv(((i + j + k) / (3.0 * N) + t * 0.03) % 1, 1, 1)
      when :sphere
        r = Math.sqrt((i - c)**2 + (j - c)**2 + (k - c)**2)
        [[255, 40, 40], [40, 255, 80], [60, 90, 255], nil][(r * 0.9 - t * 0.5).floor % 4]
      when :wave
        h = c + c * 0.8 * Math.sin(i * 0.45 + t * 0.4) * Math.cos(j * 0.45 + t * 0.3)
        (k - h).abs < 0.9 ? hsv((k / N.to_f * 0.7 + t * 0.02) % 1, 1, 1) : nil
      when :text, :picto
        return nil unless j == 0 || j == N - 1 # 앞·뒤 면에만 표시해 또렷하게
        w = data.first.size
        col = mode == :text ? i + (t % (w + N)) - N : i
        row = N - 1 - k
        return nil unless col >= 0 && col < w && data[row][col]
        hsv((col.to_f / w * 0.8 + t * 0.02) % 1, 1, 1)
      end
    end

    def self.picto_bitmap(name)
      src = PICTO[name]
      (0...N).map { |r| (0...N).map { |q| src[r * 16 / N][q * 16 / N] == '#' } }
    end

    # SketchUp 3D 텍스트를 LED 격자로 래스터화 (한글 지원). row 0 = 맨 위
    def self.raster_text(str)
      model = Sketchup.active_model
      model.start_operation('LED 텍스트', true, false, true)
      g = model.active_entities.add_group
      font = Sketchup.platform == :platform_win ? 'Malgun Gothic' : 'Apple SD Gothic Neo'
      g.entities.add_3d_text(str, TextAlignLeft, font, true, false, N * 0.85, 0.0, 0.0, true, 0.0)
      faces = g.entities.grep(Sketchup::Face)
      bb = g.bounds
      w = bb.width.ceil + 1
      y0 = bb.center.y - N / 2.0
      inside = [Sketchup::Face::PointInside, Sketchup::Face::PointOnEdge, Sketchup::Face::PointOnVertex]
      bmp = (0...N).map do |row|
        y = y0 + (N - 1 - row) + 0.5
        (0...w).map do |q|
          pt = Geom::Point3d.new(bb.min.x + q, y, 0)
          faces.any? { |f| inside.include?(f.classify_point(pt)) }
        end
      end
      g.erase!
      model.commit_operation
      bmp
    end

    # ---------- 모델 생성 ----------
    def self.pt(x, y, z)
      Geom::Point3d.new(x.mm, y.mm, z.mm)
    end

    def self.material(model, name, rgb, alpha = 1.0)
      m = model.materials[name] || model.materials.add(name)
      m.color = Sketchup::Color.new(*rgb)
      m.alpha = alpha
      m
    end

    def self.box(ents, x0, y0, z0, x1, y1, z1, mat)
      g = ents.add_group
      f = g.entities.add_face(pt(x0, y0, z0), pt(x1, y0, z0), pt(x1, y1, z0), pt(x0, y1, z0))
      f.reverse! if f.normal.z < 0
      f.pushpull((z1 - z0).mm)
      g.material = mat
      g
    end

    def self.make_sphere(model)
      d = model.definitions.add('LED_도트')
      r = (LED_D / 2.0).mm
      lat = 6
      lon = 10
      pts = (0..lat).map do |a|
        th = Math::PI * a / lat
        (0...lon).map do |b|
          ph = 2 * Math::PI * b / lon
          Geom::Point3d.new(r * Math.sin(th) * Math.cos(ph), r * Math.sin(th) * Math.sin(ph), r * Math.cos(th))
        end
      end
      mesh = Geom::PolygonMesh.new
      lat.times do |a|
        lon.times do |b|
          p1, p2 = pts[a][b], pts[a][(b + 1) % lon]
          p3, p4 = pts[a + 1][(b + 1) % lon], pts[a + 1][b]
          if a == 0 then mesh.add_polygon(p1, p3, p4)
          elsif a == lat - 1 then mesh.add_polygon(p1, p2, p3)
          else mesh.add_polygon(p1, p2, p3, p4)
          end
        end
      end
      d.entities.add_faces_from_mesh(mesh, 12) # AUTO_SOFTEN | SMOOTH_SOFT_EDGES
      d.entities.grep(Sketchup::Face).each do |f|
        f.reverse! if f.normal % (f.bounds.center - ORIGIN) < 0
      end
      d
    end

    def self.make_cable(model, length, mat)
      d = model.definitions.add('LED_케이블')
      f = d.entities.add_face(d.entities.add_circle(ORIGIN, Z_AXIS, 1.5.mm, 6))
      f.reverse! if f.normal.z < 0
      f.pushpull(length.mm)
      d.entities.grep(Sketchup::Face).each { |x| x.material = mat }
      d
    end

    def self.build
      model = Sketchup.active_model
      model.start_operation('LED 큐브 생성', true)
      black = material(model, 'LED_프레임', [25, 25, 25])
      off   = material(model, 'LED_OFF', [30, 30, 30], 0.25)
      root = model.active_entities.add_group
      root.name = ROOT
      ents = root.entities
      span    = (N - 1) * PITCH
      half    = span / 2.0
      top_z   = BOTTOM_H + span
      frame_z = top_z + FRAME_GAP
      m       = half + 150

      # 상부 프레임: 외곽 링 + 줄마다 레일
      fg = ents.add_group
      fg.name = '상부 프레임'
      fe = fg.entities
      box(fe, -m - 80, -m - 80, frame_z, m + 80, -m, frame_z + 100, black)
      box(fe, -m - 80, m, frame_z, m + 80, m + 80, frame_z + 100, black)
      box(fe, -m - 80, -m, frame_z, -m, m, frame_z + 100, black)
      box(fe, m, -m, frame_z, m + 80, m, frame_z + 100, black)
      N.times do |j|
        y = j * PITCH - half
        box(fe, -m, y - 15, frame_z, m, y + 15, frame_z + 40, black)
      end

      # 천장 행잉 와이어 + 앵커
      wg = ents.add_group
      wg.name = '행잉 와이어'
      [-m - 40, 0, m + 40].product([-m - 40, 0, m + 40]).each do |x, y|
        next if x == 0 && y == 0
        box(wg.entities, x - 3, y - 3, frame_z + 100, x + 3, y + 3, CEIL_H, black)
        box(wg.entities, x - 75, y - 75, CEIL_H - 10, x + 75, y + 75, CEIL_H, black)
      end

      # 천장 참고면
      tag = model.layers['천장(참고)'] || model.layers.add('천장(참고)')
      cg = ents.add_group
      cg.name = '천장(참고)'
      cg.layer = tag
      c = m + 1500
      cf = cg.entities.add_face(pt(-c, -c, CEIL_H), pt(c, -c, CEIL_H), pt(c, c, CEIL_H), pt(-c, c, CEIL_H))
      cf.material = cf.back_material = material(model, '천장_참고', [240, 240, 240], 0.3)

      # 케이블 + LED
      led_def   = model.definitions['LED_도트'] || make_sphere(model)
      cable_len = frame_z - (BOTTOM_H - 60)
      cable_def = make_cable(model, cable_len, black)
      kg = ents.add_group
      kg.name = '케이블'
      lg = ents.add_group
      lg.name = 'LED'
      N.times do |i|
        N.times do |j|
          x = i * PITCH - half
          y = j * PITCH - half
          kg.entities.add_instance(cable_def, Geom::Transformation.new(pt(x, y, BOTTOM_H - 60)))
          N.times do |k|
            inst = lg.entities.add_instance(led_def, Geom::Transformation.new(pt(x, y, BOTTOM_H + k * PITCH)))
            inst.material = off
          end
        end
      end
      model.commit_operation
      @leds = nil
      model.active_view.zoom_extents
    end

    # ---------- 연출 ----------
    def self.index
      return @leds if @leds && @leds.first && @leds.first[0].valid?
      root = Sketchup.active_model.entities.grep(Sketchup::Group).find { |g| g.name == ROOT }
      return nil unless root
      lg = root.entities.grep(Sketchup::Group).find { |g| g.name == 'LED' }
      return nil unless lg
      half = (N - 1) * PITCH / 2.0
      @leds = lg.entities.grep(Sketchup::ComponentInstance).map do |inst|
        o = inst.transformation.origin
        [inst, ((o.x.to_mm + half) / PITCH).round, ((o.y.to_mm + half) / PITCH).round,
         ((o.z.to_mm - BOTTOM_H) / PITCH).round]
      end
    end

    def self.led_material(model, rgb)
      q = rgb ? rgb.map { |v| [(v / 32) * 32 + 16, 255].min } : nil
      name = q ? "LED_#{q.join('_')}" : 'LED_OFF'
      @mats ||= {}
      mat = @mats[name]
      return mat if mat && mat.valid?
      @mats[name] = q ? material(model, name, q) : material(model, name, [30, 30, 30], 0.25)
    end

    def self.render(mode, t, data)
      leds = index
      return unless leds
      model = Sketchup.active_model
      model.start_operation('LED 연출', true, false, true)
      leds.each do |inst, i, j, k|
        m = led_material(model, color(mode, t, i, j, k, data))
        inst.material = m unless inst.material == m
      end
      model.commit_operation
    end

    # [렌더 모드, 데이터, 프레임 수]
    def self.prep(mode, arg = nil)
      case mode
      when :text
        bmp = raster_text(arg || '김마담')
        [:text, bmp, bmp.first.size + N]
      when :heart, :person, :arrow
        [:picto, picto_bitmap(mode), 25]
      when :sphere, :rainbow then [mode, nil, 40]
      when :wave then [mode, nil, 50]
      else raise ArgumentError, "모드 없음: #{mode}"
      end
    end

    def self.play(mode = :demo, arg = nil)
      stop
      return UI.messagebox('LED 큐브가 없어요. KimMadam::LedCube.build 를 먼저 실행해 주세요.') unless index
      @seq = if mode == :demo
               [prep(:sphere), prep(:text, arg || '김마담'), prep(:heart), prep(:rainbow),
                prep(:person), prep(:wave), prep(:arrow)]
             else
               [prep(mode, arg)]
             end
      @si = 0
      @t = 0
      @timer = UI.start_timer(1.0 / FPS, true) { tick }
    end

    def self.tick
      mode, data, len = @seq[@si]
      render(mode, @t, data)
      @t += 1
      return unless @t >= len
      @t = 0
      @si = (@si + 1) % @seq.size
    rescue => e
      stop
      puts "LED 연출 중지: #{e.message}"
    end

    def self.stop
      UI.stop_timer(@timer) if @timer
      @timer = nil
    end

    def self.show(mode, arg = nil)
      stop
      m, data, _ = prep(mode, arg)
      render(m, 0, data)
    end

    def self.add_menu
      return if @menu
      sub = UI.menu('Extensions').add_submenu('LED 큐브')
      sub.add_item('생성') { build }
      sub.add_item('데모 재생') { play(:demo) }
      sub.add_item('텍스트…') do
        r = UI.inputbox(['문구'], ['김마담'], 'LED 텍스트')
        play(:text, r[0]) if r
      end
      %i[sphere rainbow wave heart person arrow].each { |md| sub.add_item(md.to_s) { play(md) } }
      sub.add_item('정지') { stop }
      @menu = true
    end
  end
end

if defined?(UI)
  KimMadam::LedCube.add_menu
  KimMadam::LedCube.build unless KimMadam::LedCube.index
  KimMadam::LedCube.show(:sphere)
  puts 'LED 큐브 준비 완료 — KimMadam::LedCube.play(:demo) 로 연출 재생, .stop 으로 정지'
end
