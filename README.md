figma URL https://www.figma.com/file/kNRURugAsZGgOaFFM4b3Wg/%E7%84%A1%E9%A1%8C?type=design&node-id=0-1&mode=design&t=KK7YXMyo3LsWZXXA-0

■サービス名
リハビリトラッキングアプリ


■サービス概要
患者が日常的に行うべきエクササイズやストレッチのリストとその実施状況・進捗を追跡できる機能を持ったアプリケーション。患者は自分の実施状況・進捗を確認できる。また、セラピストは担当患者の実施状況や進捗を確認できる。


■ このサービスへの思い・作りたい理由
理学療法士として業務に従事する中で、自主訓練の状況によって治療効果に大きく差が出ることが分かっているが、
担当患者数が多いことによるキャパシティオーバーや訓練中以外の担当患者状況の把握が困難であること、
患者本人や看護師から実施状況・進捗をヒアリングするので情報の信憑性が低下している課題を抱えている。
病院の自主訓練に対する管理体制を変えたいと思ったので、このサービスを制作しようと思った。


■ ユーザー層について
・病院やクリニックで働いている理学療法士、作業療法士、言語聴覚士
・病院やクリニックに入院・通院している患者
理由：リハビリテーションの一環である自主訓練を対象としたアプリケーションだから。


■サービスの利用イメージ
患者は自身の自主訓練の実施状況・進捗をアプリケーション上で都度確認することができるようになる。
また、セラピストは担当患者の実施状況・進捗をデータで管理し、アプリケーション上で都度確認できるようになる。
セラピスト側は把握の効率化が進んだり、情報の曖昧性を回避できるようになったりするので、自主訓練の精度が向上し、治療効果を高めることができる。その結果、治療計画が円滑に進められるようになり、患者の治療期間を短縮させることに繋がる。患者は満足度が向上し、病院は患者を診察できる人数が増え、収益の向上になる。病院と患者のwin-winの関係を築くことが出来る価値を提供できる。


■ ユーザーの獲得について
サービスの導入前は現勤務している病院や前勤務していた病院・クリニックは繋がりがあるので、直接アポイントを取る。
特に前勤務していたクリニックではリハビリテーション科の主任をしていたこともあり、理事長や事務長、現リハビリ主任等とコネクションがあるので、直接提案を考えている。
サービスの導入後は医師からリハビリテーションの処方箋が出た患者に対して、病院の事務や担当セラピストが治療後に説明をしてサービスを届ける。


■ サービスの差別化ポイント・推しポイント
類似サービスとして「リハプリ」がある。競合しないポイントに関して、リハプリは注意障害（脳血管疾患等リハビリテーション）の患者に対するアプリケーションであるのに対して、リハビリトラッキングアプリは運動器障害（運動器リハビリテーション）の患者に対するアプリケーションである点。リハビリテーション履歴を表示する機能（グラフやデータ管理）は類似するが、当サービスはアプリケーションを通して訓練を提供するものではなく、画像や動画等を見ながら自主訓練を実施して頂くサービスであるところを差別化している。
推しポイントはカルテとアプリケーションを切り離しているので、セキュリティの観点で使用しやすい。データで管理をしているので、アナログ管理に比べて情報の信憑性が高くなり、研究や論文執筆にも活用しやすい。



■ 機能候補  
＃MVPリリース時に作っていたいもの  
⚪️ユーザーアカウントとプロフィール  
- 患者のアカウント作成・ログイン機能  
  新規作成機能、login機能  
- プロフィール情報の設定（年齢、性別、医療歴など）  
  Profile機能(CRUDで実装)  
- セラピストの管理者機能  
  admin機能  
- パスワードリセット機能  

⚪️個別のエクササイズプラン  
- 理学療法士が患者ごとのプランを作成・編集  
  患者は自分のプランを確認・実行  
  CRUDで実装  

⚪️進捗トラッキング機能  
- 患者が毎日のエクササイズやストレッチの完了を記録  
  トラッキング機能  
- カレンダー機能で過去の進捗を確認  
  カレンダー機能  

⚪️フィードバック機能  
- 患者がエクササイズ後の感じや痛みを記録  
  投稿機能  
- 理学療法士がフィードバックを提供  
  コメント機能  

⚪️通知機能  
- 患者の進捗に理学療法士からコメント作成時やトレーニングメニュー作成時に通知  
  lineのMessaging APIを使用した通知機能  


＃本リリースまでに作っていたいもの  
⚪️分析とレポート機能  
- 進捗やパフォーマンスのグラフやチャートを表示  
  Chart.js  
- 理学療法士が患者の進捗を分析  
  コメント機能  

⚪️セキュリティとプライバシー  
- 個人情報や医療データの暗号化  
  カラム暗号化機能  


■ 機能の実装方針予定  
⚪️ユーザーアカウントとプロフィール  
- 患者のアカウント作成・ログイン機能  
  →　sorceryの認証ライブラリを使用してユーザー管理を実装する。  
- セラピストの管理者機能  
  →  ライブラリを使用せず、roleカラムを用いて管理者と一般で分けて特定のユーザーに管理者の権限を付与する。  

⚪️進捗トラッキング機能  
- 患者が毎日のエクササイズやストレッチの完了を記録  
  →  進捗のトラッキングはデータベースに記録される形式で、日別またはエクササイズ別に進捗を追跡する。  
- カレンダー機能で過去の進捗を確認  
  →  FullCalendar.jsのライブラリを使用して実装する。  

⚪️フィードバック機能  
- 患者がエクササイズ後の感じや痛みを記録  
  理学療法士がフィードバックを提供  
  →  シンプルなコメント機能を導入。  

⚪️通知機能  
- 患者の進捗に理学療法士からコメント作成時やトレーニングメニュー作成時に通知  
  → LINEの公式APIを使用して、通知を送る機能を実装。  

⚪️分析とレポート機能  
→  Chart.jsで実施状況・進捗をグラフやチャートにして視覚的に表示する。  

⚪️セキュリティとプライバシー  
→  Active Record Encryptionを設定して、個人情報や医療データの暗号化し、センシティブな情報を安全に保管する。  

ER図
[![Image from Gyazo](https://i.gyazo.com/6ff8a32b6ff5d42661f31b41211159d0.png)](https://gyazo.com/6ff8a32b6ff5d42661f31b41211159d0)