# 모바일 텍사스 홀덤 경쟁 앱 기능 조사 (2026년 11월 기준)

> 대상: PokerBros, ClubGG, PPPoker, GGPoker, WSOP Poker(Playtika), PokerStars 모바일, X-Poker, Upoker, Zynga Poker
> 목적: 1인용·칩 전용(실머니 없음)·세로형 웹 홀덤 게임 기획 참고

## 0. 조사 방법과 한계 (먼저 읽어 주세요)

- 사용 도구: WebSearch(무료)만 썼습니다. CLAUDE.md의 무료 우선 원칙에 따라 유료 크레딧이 드는 Firecrawl scrape/agent는 쓰지 않았습니다.
- WebFetch로 원문을 직접 열려고 했지만, 이 세션의 네트워크 허용 목록에 `apps.apple.com`, `www.pokernews.com`, `www.vip-grinders.com`이 없어 열리지 않았습니다. 그래서 **모든 내용은 검색 결과의 요약과 발췌에 기댑니다.** 원문을 직접 확인하려면 이 호스트들을 세션 네트워크 설정에 허용해야 합니다.
- 클럽형 앱(PokerBros, PPPoker, X-Poker, Upoker)은 공식 도움말이 공개되어 있지 않아 **테이블 상단 바 아이콘이나 설정 토글 같은 세부 UI 자료가 거의 없습니다.** 자료로 확인하지 못한 항목은 "미확인"으로 적었습니다. 업계에 흔한 관행을 근거로 추정한 내용은 **[관행·추정]**으로 따로 표시했습니다.
- 표기: ✅ 출처로 확인 / ◐ 부분 확인(제3자·광고성 자료 또는 다른 지역판) / ? 미확인 / ✕ 제거된 것으로 보도됨

---

## 1. 앱별 인벤토리

### 1.1 PokerBros (클럽형, Kpgame)

| 항목 | 내용 | 출처 |
|---|---|---|
| 게임 종류 | NLH, FLH, PLO, PLO8, FL Omaha 등. Mixed Game은 최대 22종 | https://apps.apple.com/ca/app/pokerbros/id1463376042 , https://somuchpoker.com/news/pokerbros-introduces-mixed-game-up-to-22-games-in-one |
| 멀티테이블 | 최대 4테이블 동시 | https://apps.apple.com/ca/app/pokerbros/id1463376042 |
| Kill Pot | 스토어 스크린샷에 신규 기능으로 소개(Fixed Limit용) | https://apps.apple.com/ca/app/pokerbros/id1463376042 |
| 봄팟(Bomb Pot) | 클럽장이 스위치 하나로 켬. 로비 테이블에 **폭탄 아이콘**이 붙고 다음 봄팟까지 **카운트다운**이 표시됨. Double Board 또는 Run It Multi-Times와 함께 쓸 수 있으나 셋을 동시에 켤 수는 없음 | https://somuchpoker.com/explosive-action-new-pokerbros-bomb-pots |
| Double Board | 모든 NLH 테이블에서 더블 보드 | https://somuchpoker.com/news/double-board-across-the-board-on-pokerbros |
| 스트래들 | 모든 포지션에서 자발적으로 거는 스트래들 | https://thehendonmob.com/?p=7881 |
| Run it twice/다회 | Run It Multi-Times. MTT에는 Bubble Protection과 파이널 테이블 딜 | https://somuchpoker.com/explosive-action-new-pokerbros-bomb-pots , https://worldpokerdeals.com/blog/new-mtt-features-at-pokerbros |
| 안티봇 | Photo Rotation Verification: 착석하려면 15초 안에 슬라이더로 사진을 바로 맞춰야 함 | https://cardplayer.com/poker-news/25634-pokerbros-introduces-new-anti-bot-feature |
| 이모트·던지기 | 채팅, 이모트, 선물. 상대에게 '똥' 이모지를 던지는 기능이 있음(10만 개 던지기 이벤트) | https://www.brsoftech.com/blog/pokerbros-vs-pppoker-vs-xpoker/ , https://www.thehendonmob.com/?p=7011 |
| 재화 | Diamonds(소셜 재화) | https://www.thehendonmob.com/?p=7011 |
| 디자인 평 | "vibrant design"(화사한 디자인) | https://www.brsoftech.com/blog/pokerbros-vs-pppoker-vs-xpoker/ |
| 인슈어런스·스퀴즈·래빗헌트 | ? 검색 결과로는 확인되지 않음 | — |

### 1.2 ClubGG (GG 계열 클럽 앱, NSUS)

| 항목 | 내용 | 출처 |
|---|---|---|
| 테이블 옵션 | All-In Insurance, Running it Twice, 게임 제한(IP/GPS/기기/채팅), 게임 길이 조절. 블라인드 범위 0.01/0.02부터 1,000/2,000까지 | https://www.pokerlistings.com/clubgg |
| 사용자 평 | 스트래들, 타임뱅크, 멀티보드 등 테이블 설정이 풍부하다는 App Store 리뷰. 단 공개 테이블은 없음 | https://apps.apple.com/us/app/clubgg-poker/id1529839330 |
| 멀티테이블 | 최대 4게임 동시 | https://apps.apple.com/us/app/clubgg-poker/id1529839330 |
| Smart HUD | 본인과 상대의 VPIP, PFR, C-bet 등 통계 | https://www.vip-grinders.com/clubgg-review (검색 요약) |
| 레이아웃 | 세로형(vertical) 레이아웃, 향상된 그래픽, 세로 베팅 슬라이더, 세로 테이블, **Bet-Pot 버튼** | https://www.pokerlistings.com/poker-sites/clubgg |
| 기타 | Bomb Pot. 멤버십 구독 등급(Standard $9.99, Platinum $49.99 등) | https://www.pokerlistings.com/poker-sites/clubgg |
| Rabbit Hunt / River Squeeze | ◐ 유료 멤버십 등급에 묶인 기능이라는 제3자 서술이 있음(날짜 불명) | https://www.pokerlistings.com/clubgg (검색 요약) |
| 사용자 불만 | "호스트 기능은 좋지만 배터리 소모가 큼" | https://ca.trustpilot.com/review/www.clubgg.com |

### 1.3 PPPoker (클럽형)

| 항목 | 내용 | 출처 |
|---|---|---|
| 정체성 | 세계 최대 규모의 프라이빗 클럽 기반 플랫폼 | https://apps.apple.com/in/app/id1101622978 |
| 멀티테이블 | 모바일 최대 3테이블. 행동할 차례인 테이블을 플래그로 알림. PC판은 창 크기를 바꿀 수 있는 테이블 최대 5개 | https://cardplayer.com/poker-news/24502-pppoker-is-the-app-for-poker-lovers , https://cardplayer.com/poker-news/25054-pppoker-releases-new-pc-version-play-up-to-five-customizable-table-windows |
| 게임 | 클럽 MTT·SNG, Flash Poker(패스트폴드) | https://cardplayer.com/poker-news/24502-pppoker-is-the-app-for-poker-lovers |
| Disconnection Protection | 연결이 끊기면 자리에서 빠지기 전에 추가 행동 시간을 줌(타임뱅크와 비슷한 개념) | https://apps.apple.com/in/app/id1101622978 |
| 보안 | 안티치트 팀, RNG 테스트, 빅데이터 분석, IP/GPS 제한 | https://apps.apple.com/in/app/id1101622978 |
| 데이터·리플레이 | ◐ 상세 분석 내보내기와 고급 핸드 리플레이는 다이아몬드(유료) | https://pokernetai.pages.dev/blog/pppoker-vs-pokerbros-club-owners-2026/ |
| 스퀴즈·인슈어런스·RIT | ? 이번 검색으로는 확인되지 않음. 흔히 "PPPoker 스퀴즈"로 알려져 있지만 출처를 찾지 못함 | — |

### 1.4 GGPoker (실머니 대형 룸, 모바일 UX 업계 1위 평가)

| 항목 | 내용 | 출처 |
|---|---|---|
| 세로형·한 손 조작 | 세로 화면이라 한 손으로 플레이 가능. 세로·가로 모두 완성도 높음. 세로 모드에서 최대 4테이블 | https://apps.apple.com/ie/app/ggpoker/id1504833971 , https://www.deucescracked.com/poker/best-poker-mobile-only |
| 모바일 레이아웃 평 | 카드, 칩, 베팅 슬라이더가 작은 화면에 맞춰져 있음. 데스크톱을 그대로 옮긴 PokerStars보다 폰에 맞게 설계됨 | https://www.deucescracked.com/poker/ggpoker-vs-pokerstars-for-mobile |
| Smart HUD | 테이블 위에서 상대 통계 표시 | https://www.pokernews.com/news/promotions/2020/07/improve-your-game-for-the-wsop-ggpoker-smart-hud-37439.htm |
| PokerCraft | 앱 안에서 핸드 히스토리와 세션 통계 확인 | https://www.pokernews.com/ggpoker/app.htm |
| Smart Betting | 내 베팅 패턴과 현재 추세로 알고리즘이 추천하는 베팅 사이즈 버튼. 맞는 것이 없으면 더 요청 가능 | https://www.pokernews.com/news/promotions/2020/05/use-smart-betting-to-improve-your-game-on-ggpoker-37161.htm |
| 베팅 프리셋 | ◐ 단축 버튼 4개를 설정 가능(프리플랍은 BB 배수, 포스트플랍은 팟 %) | https://www.ccn.com/crypto-casinos/reviews/ggpoker/ |
| All-in Insurance / EV Cashout | 올인 후 남은 카드가 깔리기 전에 지분 EV를 현금화. 에퀴티 60% 이상일 때 제안됨. 수수료 1%(PLO6는 2%). 플랍 이후 올인에만 적용 | https://www.pokerlistings.com/news/no-need-to-worry-about-bad-beats-at-ggpoker-thanks-to-the-ev-cashout-feature , https://worldpokerdeals.com/blog/ev-cashout-at-ggpoker-everything-you-need-to-know |
| Run It Multiple Times | 언더독은 RIMT만 제안할 수 있음 | https://worldpokerdeals.com/blog/ev-cashout-at-ggpoker-everything-you-need-to-know |
| Card Squeeze | 설정에서 켜면 홀카드가 뒷면으로 오고, 손가락으로 천천히 쥐어 짜듯 펴거나 'Open' 버튼으로 바로 공개. 100BB 이상 캐시 팟과 모든 토너먼트 올인에서는 **보드 카드도 스퀴즈** 가능 | https://pokerfuse.com/news/poker-room-news/218897-enjoy-card-squeeze-feature-exclusively-wsop/ (GG Ontario/WSOP ON) |
| 이모지·리액션 | 핸드 중 이모지(이모지가 카드를 가린다는 불만도 있음). GIPHY GIF는 이름 박스 위에 표시. SnapCam 15초 영상 리액션 | https://apps.apple.com/ie/app/ggpoker/id1504833971 , https://pokerfuse.com/news/poker-room-news/216995-ggpoker-new-giphy-online-poker-gif-library/ , https://www.pokernews.com/news/2020/08/ggpoker-introduces-snapcam-send-video-reactions-to-opponents-37747.htm |
| Splash(던지기) | 핸드에서 진 뒤에만 계란이나 물 양동이를 상대에게 던질 수 있음. 엄지 위·아래 리액션도 있음 | https://www.pokerlistings.com/news/new-feature-splash-you-opponents-at-ggpoker |
| 특수 포맷 | Spin & Gold(3인 SNG, 상금 배수 랜덤 추첨, 최대 12,000배), Flip & Go(홀카드 3장 중 1장 버리는 플립 단계 → Go 단계), Rush & Cash(패스트폴드), All-In or Fold | https://pokerfuse.com/news/poker-room-news/211240-ggpokers-lottery-style-sit-go-format-spin-gold-goes-live/ , https://pokerlistings.com/blog/flip-go-a-complete-guide-to-ggpokers-unique-tournament-format , https://www.deucescracked.com/poker/best-poker-mobile-only |
| Bet on Flop | 플랍 색(빨강 우세/검정 우세), 페어, 플러시, 스트레이트, 트립스 등에 거는 사이드벳 | https://www.pokernews.com/news/2022/02/ggpoker-launches-bet-on-the-flop-cash-game-feature-40655.htm |
| 로비 탭 | ◐ 'Promotions'와 'My Rewards' 탭이 있음 | https://www.pokernews.com/ggpoker/app.htm |

### 1.5 WSOP Poker (Playtika, 소셜·무료 칩) — 우리 게임과 성격이 가장 가까운 앱

| 항목 | 내용 | 출처 |
|---|---|---|
| 핸드 강도 바 | 화면 하단의 작은 정보 바가 **내 패의 상대적 강도**를 표시 | https://pokerfuse.com/online-poker/social-poker/playwsop-review/ |
| 소셜 | 채팅. 친구를 초대해 같은 테이블에서 플레이. 친구에게 선물을 보내 칩 획득. 하트를 모아 아바타·이모트로 교환 | https://apps.apple.com/us/app/id719525810 , https://pokerfuse.com/online-poker/social-poker/playwsop-review/ |
| 메타 | VIP 등급. WSOP Collectibles(디지털 반지·브레이슬릿). WSOP Academy 튜토리얼. 2026년 레벨 진행 시스템 전면 재구축 | https://apps.apple.com/us/app/id719525810 , https://marlvel.ai/api/llm/apps/games/wsop-poker-texas-holdem-game , https://capital.com/en-int/news/wsop-poker-s-biggest-update-yet-gives-players-a-new-reason |
| 연출 | 인터랙티브 아바타 호스트, 시즌 테마 핸드(festive poker hands) | https://investors.playtika.com/news-releases/news-release-details/world-series-pokers-biggest-names-team-celebrate-official-apps/ |
| 그래픽 평 | 그래픽 칭찬이 많고 "polished"라는 평. 반면 "불필요한 그래픽으로 화면이 가득하다", "로비가 다소 복잡하다"는 지적도 있음 | https://grand-screen.com/games/wsop-poker-texas-holdem-game/ , https://gamebrain.co/game/wsop-poker-texas-holdem-game , https://www.pokernews.com/world-series-of-poker/ |
| 불만 | 과금 압박이 가장 큰 불만. 불안정성 | https://marlvel.ai/api/llm/apps/games/wsop-poker-texas-holdem-game |

### 1.6 PokerStars 모바일

| 항목 | 내용 | 출처 |
|---|---|---|
| 베팅 슬라이더·프리셋 | Settings > Gameplay > Bet Slider에서 프리플랍(BB 배수)과 포스트플랍(팟 %) 단축 버튼을 각각 최대 4개 설정. 근거는 데스크톱 자료 | https://www.pokernews.com/strategy/using-pokerstars-tools-to-your-advantage-26485.htm |
| 자동 기능 | 자동 리바이, 자동 착석, 자동 테이블 전환 | https://worldpokerdeals.com/blog/pokerstars-rolls-out-new-ios-mobile-app |
| 2025년 그래픽 개편 | 테이블 버튼, 베팅 슬라이더, 타임뱅크 그래픽을 모든 플랫폼에서 통일 | https://www.pokerlistings.com/news/pokerstars-november-2025-updates-whats-new-behind-the-scenes |
| 테마 | 데스크톱 테이블 테마(Mercury Lite, 시즌 테마) | https://www.pokerlistings.com/news/average-mystery-bounty-center-this-player-new-themes-pokerstars-updates-for-november-13 |
| 로비 | 'Build Your Own Lobby'(즐겨찾기 고정, 카테고리 재배치). 근거는 온타리오판 | https://www.pokernews.com/casino/review/pokerstars-casino-ontario/new-features.htm |
| 던지기 | Throwables(폭죽, 티슈 상자, 알람시계). 데스크톱 기준이고 모바일 지원은 미확인 | https://pokerfuse.com/s48j |
| All-in Cash Out | 올인 인슈어런스 기능 | https://www.pokernews.com/news/2019/07/pokerstars-all-in-cash-out-feature-insurance-protection-34983.htm |
| 형식 | Zoom(패스트폴드), Spin & Go | https://www.deucescracked.com/poker/ggpoker-vs-pokerstars-for-mobile |
| 평가 | 데스크톱을 그대로 옮긴 느낌이라 폰 최적화는 GG보다 약함. 반면 슬라이더 터치 제스처는 반응이 좋음 | https://www.deucescracked.com/poker/ggpoker-vs-pokerstars-for-mobile , https://www.deucescracked.com/poker/best-poker-mobile-only |
| FanDuel판 반발 | ✕ 수십 종의 테이블 테마와 선호 좌석 기능이 사라졌다는 사용자 반발 보도 | https://poker-rift.pages.dev/news/pokerstars-fanduel-launch-mixed-reactions-software-controversy/ (저신뢰) |

### 1.7 X-Poker (클럽형)

| 항목 | 내용 | 출처 |
|---|---|---|
| 기본 | 무료 홈게임 앱. 프라이빗 클럽을 만들고 원하는 유형의 테이블을 열어 친구 초대. "영구 더블 다이아몬드" | https://apps.apple.com/us/app/id1534470447?l=en-us |
| 멀티테이블 | 3테이블 동시. 잭팟 | https://apps.apple.com/tw/app/x-poker-%E5%BE%B7%E5%B7%9E%E6%92%B2%E5%85%8B-%E5%8D%81%E4%B8%89%E6%94%AF%E7%B4%84%E5%B1%80/id1534470447 |
| HUD | 핸드 컨버터를 거쳐 HUD 사용 가능. 인증된 RNG(2023년 자료) | https://worldpokerdeals.com/rakeback-deals/x-poker-review |
| 인슈어런스·RIT | ? 미확인 | — |

### 1.8 Upoker (클럽형)

| 항목 | 내용 | 출처 |
|---|---|---|
| 구조 | 유니온 하나에 최대 25개 클럽, 클럽 하나에 최대 1,200명 | https://worldpokerdeals.com/rakeback-deals/upoker-review |
| 인슈어런스 | 클럽장이 올인 인슈어런스를 켜고 끌 수 있음(유료) | https://worldpokerdeals.com/rakeback-deals/upoker-review |
| 테이블 관리 | 기기 제한, 테이블 자동 연장·자동 재시작, 바이인 승인, GPS/IP 제한 | https://worldpokerdeals.com/rakeback-deals/upoker-review |
| UX 평 | 쓰기 쉽고 디자인이 매끄러움. **세로 모드에서 최대 4테이블** | https://worldpokerdeals.com/rakeback-deals/upoker-review |
| 주의 | PokerListings는 "피해야 할 룸"으로 평가 | https://www.pokerlistings.com/poker-sites/upoker |

### 1.9 Zynga Poker (소셜·무료 칩)

| 항목 | 내용 | 출처 |
|---|---|---|
| 테이블 | 9인 기본 테이블과 빠른 5인 테이블 | https://apps.appfollow.io/ios/zynga-poker-tm-texas-hold-em/354902315?country=us |
| 모드 | Spin and Win(프라이즈 휠 + 토너먼트), MTT(주말 Trillionaire Maker), Short Deck(2022), Poker Leagues | https://news.worldcasinodirectory.com/zynga-launches-new-poker-game-2234 , https://www.gamedeveloper.com/press-release/zynga-poker-and-rob-riggle-partner-to-unveil-highly-anticipated-multi-table-tournaments , https://www.pokernews.com/news/2022/01/zynga-poker-short-deck-40594.htm , https://www.gamingintelligence.com/products/casino/19491-zynga-launches-poker-leagues-tournament-feature/ |
| 수익화 | 광고와 인앱 구매(칩, 꾸밈 아이템), VIP | https://wptcan-com.pages.dev/faqs/zynga-poker-free-download-play-guide/ |
| 교훈 | 2014년 개편 때 "원치 않는 기능이 플레이를 가로막는다"는 반발을 샀음. 기능 과잉을 경계해야 함 | https://wikipedia.com/wiki/Zynga_Poker |
| 평점 | 약 4.5점(13만 건 이상). RNG 공정성 불만이 다수 | https://apps.appfollow.io/ios/zynga-poker-tm-texas-hold-em/354902315?country=us |

---

## 2. 상단 바 / 로비 / 설정 (요청 항목 1, 2, 4)

출처로 확인된 세부 사항이 적어 아래처럼 정리했습니다. **확인된 사실**과 **[관행·추정]**을 섞지 않도록 나눴습니다.

**확인된 사실**
- 로비의 테이블 행에 상태 아이콘(봄팟 폭탄 아이콘과 카운트다운)을 붙임 — PokerBros: https://somuchpoker.com/explosive-action-new-pokerbros-bomb-pots
- 로비 탭: Promotions / My Rewards — GGPoker: https://www.pokernews.com/ggpoker/app.htm
- 사용자가 직접 꾸미는 로비(즐겨찾기 고정, 카테고리 재배치) — PokerStars: https://www.pokernews.com/casino/review/pokerstars-casino-ontario/new-features.htm
- 설정 항목:
  - 카드 스퀴즈 토글 — GG: https://pokerfuse.com/news/poker-room-news/218897-enjoy-card-squeeze-feature-exclusively-wsop/
  - 베팅 슬라이더와 프리셋, 자동 리바이·자동 착석 — PokerStars: https://www.pokernews.com/strategy/using-pokerstars-tools-to-your-advantage-26485.htm
  - 테이블 테마와 덱 선택(메뉴 > Settings > Theme 경로, 앱 미상) — https://sites.google.com/view/pokerteam/poker/poker-how-to
  - 4색 덱(스페이드 검정, 하트 빨강, 클럽 초록, 다이아 파랑)과 스택을 BB 단위로 표시 — https://betterpoker.vercel.app/learn/absolute-beginner/positions-and-table-mechanics/online-interface-basics
- 클럽장 테이블 설정: 인슈어런스, RIT, IP/GPS/기기/채팅 제한, 게임 길이 — ClubGG: https://www.pokerlistings.com/clubgg

**[관행·추정] 업계 공통 구성** (출처로 확인한 것이 아니라 일반적인 구성을 근거로 한 추정이며, 구현 체크리스트 용도로만 쓰세요)
- 로비 상단: 아바타·레벨, 칩 잔액(+상점 단축), 보조 재화(다이아/골드), 우편함, 설정
- 로비 하단 탭(4~5개): 홈/캐시, 토너먼트, 클럽, 상점, 프로필
- 테이블 상단: ☰ 메뉴(일어서기, 테이블 나가기, 리바이·충전, 설정, 규칙), 테이블 정보(블라인드, 핸드 번호), 핸드 히스토리, 채팅
- 테이블 하단: 이모지 버튼, 사전 행동 체크박스(Check/Fold, Call Any, Check), 베팅 영역

---

## 3. 종합 비교 매트릭스 (기능 × 앱)

| 기능 | PokerBros | ClubGG | PPPoker | GGPoker | WSOP | PokerStars | X-Poker | Upoker | Zynga |
|---|---|---|---|---|---|---|---|---|---|
| 세로형 테이블 | ? | ✅ | ? | ✅ | ? | ✅(평가) | ? | ✅ | ? |
| 멀티테이블 | ✅4 | ✅4 | ✅3 (PC 5) | ✅4 | ? | ✅ | ✅3 | ✅4 | ? |
| 베팅 프리셋·슬라이더 | ? | ✅(Bet-Pot, 세로 슬라이더) | ? | ✅(Smart Betting) | ? | ✅(4개 커스텀) | ? | ? | ? |
| 타임뱅크 | ? | ✅ | ◐(Disconnection Protection) | ? | ? | ✅(그래픽 개편) | ? | ? | ? |
| 스퀴즈 | ? | ◐(River Squeeze) | ? | ✅ | ? | ? | ? | ? | ? |
| Run It Twice/다회 | ✅ | ✅ | ? | ✅(RIMT) | ? | ? | ? | ? | ? |
| 올인 인슈어런스/EV 캐시아웃 | ? | ✅ | ? | ✅ | ? | ✅ | ? | ✅ | ? |
| 래빗헌트 | ? | ◐ | ? | ? | ? | ? | ? | ? | ? |
| 스트래들 | ✅ | ✅ | ? | ? | ? | ? | ? | ? | ? |
| 봄팟·더블보드 | ✅ | ✅(봄팟) | ? | ? | ? | ? | ? | ? | ? |
| 이모지·던지기 | ✅(던지기) | ? | ? | ✅(Splash, GIF, SnapCam) | ✅(이모트) | ✅(Throwables) | ? | ? | ? |
| 채팅 | ✅ | ✅(제한 가능) | ? | ✅ | ✅ | ? | ? | ? | ? |
| HUD·통계 | ? | ✅ | ◐(유료) | ✅ | ? | ? | ◐ | ? | ? |
| 핸드 강도 표시 | ? | ? | ? | ? | ✅ | ? | ? | ? | ? |
| 테이블 테마 | ? | ? | ? | ? | ✅(시즌) | ✅(데스크톱; FanDuel판 ✕) | ? | ? | ? |
| 사이드벳·특수 모드 | ✅Mixed 22 | ? | ✅Flash | ✅Spin&Gold, Flip&Go, Bet on Flop | ✅Collectibles | ✅Spin&Go, Zoom | ✅Jackpot | ? | ✅Spin&Win, Short Deck |
| 선물·소셜 재화 | ✅Diamonds | ✅구독 | ✅Diamonds | ? | ✅선물·하트 | ? | ✅Diamonds | ? | ✅VIP |

출처는 1장 표를 따릅니다. "?"는 기능이 없다는 뜻이 아니라 **출처로 확인하지 못했다**는 뜻입니다.

---

## 4. 1인용·칩 전용·세로형 웹 홀덤 우선 도입 기능 Top 15

(보편성, 칭찬받는 정도, 1인·무과금 환경에서의 적합성 순)

1. **세로형 한 손 조작 레이아웃** — 행동 버튼(Fold, Check/Call, Raise)과 슬라이더를 엄지가 닿는 하단 1/3에 모읍니다. GG·ClubGG·Upoker가 세로형으로 호평을 받았습니다(https://apps.apple.com/ie/app/ggpoker/id1504833971 , https://www.deucescracked.com/poker/best-poker-mobile-only).
2. **베팅 프리셋 버튼 + 슬라이더** — 프리플랍은 2.5x, 3x, 4x BB, 포스트플랍은 ⅓, ½, ⅔, Pot, All-in. 슬라이더는 세로 방향(ClubGG)으로 두고, 프리셋을 누르면 슬라이더가 그 값으로 이동합니다. PokerStars는 프리셋 4개를 커스텀할 수 있습니다(https://www.pokerlistings.com/poker-sites/clubgg , https://www.pokernews.com/strategy/using-pokerstars-tools-to-your-advantage-26485.htm). 슬라이더는 실수로 올인하기 쉬운 주범이라 확인 단계가 필요합니다(https://betterpoker.vercel.app/learn/absolute-beginner/positions-and-table-mechanics/online-interface-basics).
3. **사전 행동 체크박스** — Check/Fold, Check, Call Any. 내 차례가 아닐 때 행동 버튼 자리에 반투명 토글로 보여 줍니다. [관행]
4. **행동 타이머 링 + 타임뱅크** — 아바타 테두리에 원형 진행 바를 두고 초록 → 노랑 → 빨강으로 바꿉니다. 시간이 다 되면 타임뱅크 배지가 켜집니다(PokerStars 타임뱅크 그래픽 개편: https://www.pokerlistings.com/news/pokerstars-november-2025-updates-whats-new-behind-the-scenes).
5. **핸드 강도 표시** — 하단 바에 현재 족보 이름(예: "투 페어")과 강도 막대를 표시합니다(WSOP: https://pokerfuse.com/online-poker/social-poker/playwsop-review/). 1인 학습용 게임에 특히 잘 맞습니다.
6. **카드 스퀴즈(피크)** — 홀카드를 뒷면으로 주고, 드래그한 거리만큼 모서리를 펴 보입니다. 'Open' 버튼으로 바로 공개. 큰 팟의 리버 스퀴즈는 극적 연출로 쓸 수 있습니다(https://pokerfuse.com/news/poker-room-news/218897-enjoy-card-squeeze-feature-exclusively-wsop/).
7. **올인 에퀴티 표시 + Run It Twice** — 올인 쇼다운 때 각 플레이어 위에 승률 %를 띄우고, 보드 두 줄을 나눠 깝니다(https://worldpokerdeals.com/blog/ev-cashout-at-ggpoker-everything-you-need-to-know , https://www.pokernews.com/strategy/why-running-it-twice-does-not-affect-your-odds-32880.htm).
8. **올인 인슈어런스/EV 캐시아웃(칩 버전)** — 에퀴티 60% 이상이면 "EV × 팟 − 1% 수수료"를 받을지 묻는 모달을 띄웁니다(https://www.pokerlistings.com/news/no-need-to-worry-about-bad-beats-at-ggpoker-thanks-to-the-ev-cashout-feature). 칩 게임에서는 긴장감을 주는 장치로 쓸 수 있습니다.
9. **래빗헌트** — 모두 폴드한 뒤 남은 보드를 반투명하게 공개합니다(https://network.pokernow.com/blog/what-is-the-rabbit-hunting-feature).
10. **이모트·던지기 리액션** — AI 상대에게 계란이나 토마토를 던지면 포물선으로 날아가 깨지는 스프라이트 애니메이션과 효과음이 나옵니다(GG Splash: https://www.pokerlistings.com/news/new-feature-splash-you-opponents-at-ggpoker , party 던지기 애니메이션·효과음: https://pokerfuse.com/news/poker-room-news/211024-exclusive-partypoker-introduces-social-currency-its-new/). AI 봇이 이모트로 반응하면 생동감이 생깁니다. 카드를 가리지 않게 배치해야 합니다(GG 리뷰 불만).
11. **핸드 히스토리·리플레이 + 개인 통계(PokerCraft 축소판)** — 최근 N핸드 목록, VPIP/PFR, 승률 그래프(https://www.pokernews.com/ggpoker/app.htm).
12. **간이 HUD(상대 AI 성향 태그)** — 아바타 아래에 VPIP/PFR 2개 수치나 "타이트/루즈" 색 태그를 붙입니다(https://www.pokernews.com/news/promotions/2020/07/improve-your-game-for-the-wsop-ggpoker-smart-hud-37439.htm).
13. **테이블 테마·펠트·카드 백·4색 덱 설정** — 4색 덱 토글, 펠트 색 3~5종, 시즌 테마(https://betterpoker.vercel.app/learn/absolute-beginner/positions-and-table-mechanics/online-interface-basics , https://www.pokerlistings.com/news/average-mystery-bounty-center-this-player-new-themes-pokerstars-updates-for-november-13). FanDuel판에서 테마를 없앴다가 반발을 산 사례가 있습니다.
14. **스택을 BB 단위로 표시하는 토글 + 자동 리바이(칩 충전)** — https://betterpoker.vercel.app/learn/absolute-beginner/positions-and-table-mechanics/online-interface-basics , https://worldpokerdeals.com/blog/pokerstars-rolls-out-new-ios-mobile-app
15. **스트래들·봄팟 같은 변형 이벤트 + 일일 보상 휠(Spin & Win형)** — 봄팟은 테이블에 폭탄 아이콘과 카운트다운을 띄웁니다(https://somuchpoker.com/explosive-action-new-pokerbros-bomb-pots). 무료 칩 보상 휠과 랜덤 배수 연출(Spin & Gold, Spin and Win)도 같은 맥락입니다(https://news.worldcasinodirectory.com/zynga-launches-new-poker-game-2234).

**경계할 점**: 기능이 과하거나 로비가 복잡하면 반발을 삽니다(Zynga 2014년 개편, WSOP의 "불필요한 그래픽"). 핵심 테이블 화면은 깔끔하게 유지하고, 부가 기능은 메뉴나 시트 안에 접어 두세요(https://wikipedia.com/wiki/Zynga_Poker , https://gamebrain.co/game/wsop-poker-texas-holdem-game). 디자인 사례에서도 "카드와 칩은 진짜처럼, 시각적 잡음은 제거"를 권합니다(https://sites.google.com/calmbeast.com/calmbeast/my-portfolio/felt-gaming).

---

## 5. 그래픽 품질 기법 (CSS/JS 구현용)

경쟁 앱에서 공개적으로 확인된 근거는 이렇습니다.
- 칩 이동과 카드 플립을 "현실적인 타이밍"으로 처리: https://dribbble.com/services/129369-Casino-Game-Design-Poker-Roulette-Keno
- 카드는 덱 위치에서 손 위치로 펠트 위를 미끄러지듯 이동: https://wbcomdesigns.com/web-design-elements-to-craft-the-online-blackjack-experience/
- 이벤트마다 여러 피드백 채널을 겹침(Balatro): https://blakecrosley.com/guides/design/balatro
- 던지기 아이템은 애니메이션과 효과음을 함께 씀: https://pokerfuse.com/news/poker-room-news/211024-exclusive-partypoker-introduces-social-currency-its-new/
- 버튼, 슬라이더, 타임뱅크 시각 언어를 통일(PokerStars): https://www.pokerlistings.com/news/pokerstars-november-2025-updates-whats-new-behind-the-scenes

아래 수치는 이 근거를 웹에서 구현하기 위한 **제안값**입니다.

1. **펠트 조명(3D 느낌)**
   - `background: radial-gradient(ellipse 70% 55% at 50% 40%, #2f8a57 0%, #1d6a40 45%, #0f3d25 80%, #08241a 100%)`
   - 그 위에 노이즈 텍스처를 `opacity:.06; mix-blend-mode:overlay`로 얹어 천 질감을 냅니다(SVG feTurbulence를 data URI로).
   - 레일(테두리)은 `border-radius:48%`의 세로 타원으로, `box-shadow: inset 0 0 0 10px #3a2416, inset 0 0 0 12px #c9a25a55, 0 20px 60px #000a`.
2. **비네트** — `body::after { background: radial-gradient(circle at 50% 45%, transparent 55%, rgba(0,0,0,.65) 100%); pointer-events:none }`
3. **카드 딜 애니메이션** — 딜러 위치에서 각 좌석까지 `transform: translate() rotate()`로 이동합니다. 320~420ms, `cubic-bezier(.2,.8,.2,1)`, 카드 간격 60~90ms로 순차 진행. 착지할 때 `scale(1.04 → 1)`로 살짝 튀게 합니다.
4. **카드 플립** — `perspective:800px; transform-style:preserve-3d; backface-visibility:hidden`. `rotateY(180deg)`로 300ms, `cubic-bezier(.4,0,.2,1)`. 중간(90°)에서 하이라이트 그라디언트를 지나가게 하면 광택이 납니다.
5. **스퀴즈** — 포인터 드래그한 거리를 `clip-path: polygon()`이나 회전하는 마스크에 연결해 카드 모서리를 말아 올립니다(`linear-gradient(135deg, transparent 50%, #0003 52%, #fff 53%)`로 접힌 면). 임계값을 넘으면 자동으로 플립합니다.
6. **칩 스택과 칩 이동** — 칩은 SVG 원판 하나에 `box-shadow: 0 2px 0 #0006` 레이어를 쌓아 두께를 표현하고, 스택은 칩마다 `translateY(-3px)`. 팟으로 모일 때는 베지어 곡선 경로(Web Animations API 키프레임 3점)로 250~400ms, 칩마다 30ms 간격. 마지막에 팟 숫자를 카운트업합니다(requestAnimationFrame, easeOutCubic).
7. **승자 연출** — 승자 아바타에 금색 글로우 `box-shadow: 0 0 0 3px #f5d06b, 0 0 24px 6px #f5c84299`를 펄스로 넣습니다(1.2s 무한, ease-in-out). 위닝 5장은 `translateY(-8px)`로 들어 올리고 나머지 카드는 `filter: brightness(.45)`로 어둡게. 파티클(캔버스, 40~80개 금색 조각과 별, 중력과 페이드)을 곁들이고, 족보 배너는 `scale(.6 → 1.1 → 1)`로 스프링 튕김.
8. **글래스(블러) 패널** — 메뉴, 설정 시트, 핸드 히스토리: `background: rgba(16,20,28,.55); backdrop-filter: blur(14px) saturate(140%); border:1px solid rgba(255,255,255,.08); border-radius:20px`. 하단에서 올라오는 시트는 `translateY(100% → 0)` 280ms에 스프링 이징.
9. **금속성 골드 UI** — 버튼과 칩 잔액 배지: `background: linear-gradient(180deg,#fff3c4 0%,#f2c75c 35%,#c8922a 70%,#8a5a12 100%)`, 위쪽에 1px 하이라이트 `inset 0 1px 0 #fff9`, 텍스트 `text-shadow: 0 1px 0 #6b4210`. 행동 버튼은 기능에 따라 색을 나눕니다: Fold는 회청색, Call은 초록, Raise는 금색 또는 주황.
10. **타이머 링** — SVG `circle`에 `stroke-dasharray`, `stroke-dashoffset`을 애니메이션합니다. 남은 25% 아래에서는 빨간색 깜박임과 햅틱(`navigator.vibrate(30)`)을 씁니다.
11. **타이포그래피** — 숫자에는 `font-variant-numeric: tabular-nums`(칩 카운트가 흔들리지 않게). 굵은 산세리프 계열(Inter, Montserrat)로 금액 가독성을 확보하고, 족보 배너는 조금 더 장식적인 세리프나 디스플레이체로.
12. **사운드와 햅틱을 겹치기** — 딜, 칩, 체크(톡톡), 승리 사운드를 짧게 겹칩니다(Balatro식 다채널 피드백). `prefers-reduced-motion`을 감지하면 파티클을 끄고 시간을 절반으로 줄입니다.
13. **성능** — `transform`과 `opacity`만 애니메이션하고, 움직이는 카드와 칩에 `will-change: transform`을 겁니다. 파티클은 캔버스 하나에서 처리합니다. 배터리 소모가 클럽 앱의 실제 불만으로 나온 적이 있으니(ClubGG Trustpilot: https://ca.trustpilot.com/review/www.clubgg.com) 탭이 숨겨지면 rAF를 멈추세요.

---

## 6. 후속 권고

- `apps.apple.com`, `www.pokernews.com`, `www.vip-grinders.com`을 세션 네트워크에 허용하면, 앱스토어 스크린샷 설명과 버전 노트로 상단 바 아이콘과 설정 토글의 실제 목록을 확인할 수 있습니다.
- 클럽형 앱의 세부 UI(PPPoker 스퀴즈, PokerBros 인슈어런스)는 공개 문서가 없어 실제 앱을 직접 써 보거나 YouTube 워크스루를 보는 것이 가장 확실합니다.
