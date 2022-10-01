
# Nuxt 3

## ディレクトリ構成（重要部分のみ）
```
.
├── asset/                           画像ファイルなど
├── components/                      vueのコンポーネント(使いまわせるパーツ)
│       └ management/                 pages/management/ で使用
├── composables/                     ログイン状況やAPIのデータなどの状態管理
├── layouts/                         ヘッダーやサイドメニューバーなどの全体レイアウト
├── middleware/                      リダイレクトなどのミドルウェア
├── pages/                           各種ページのVueファイル(下に別記)
├── plugins/                         vuetifyなどのプラグイン
├── public/                          faviconなど
├── server/                          Nuxtのサーバー機能
│       └ api/                        バックエンドと連携用API
├── app.vue                          レイアウトとページを合体させ、表示させる入れ物
└── nuxt.config.ts                   vuetifyやSassといったプラグインを読み込む
```

## ページ
```
pages/
  ├ management/                        駐輪場管理に関するフォルダ
  │    ├ [id]/                        駐輪場に設定された ID からページを自動で生成するフォルダ
  │       ├ data.vue                  Vue-chart.jsを使ったデータの可視化ページ
  │       ├ index.vue                 駐輪場の個別管理ページ
  │    └ index.vue                    駐輪場一覧ページ
  ├ setting/                           設定ページ
  │    ├ [id]/                     
  │       ├ index.vue                 駐輪場の削除やカメラの動作on/offをAPIで設定するページ
  │       ├ newCameraForm.vue         カメラ登録用フォーム
  │    └ index.vue                    全体の設定ページ
  │    └ new.vue                      新規駐輪場の登録用フォーム
  ├ index.vue                          初期画面(ダッシュボード)
  └ login.vue                          ログイン画面
```