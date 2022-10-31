
# YOLOv5を用いた駐輪場管理業務支援システム(bicycle_system)
Bicycle parking lot management system using YOLOv5  
## ディレクトリ構成  
```
bicycle_system
　│─ open_pages(一般ユーザー向けのGISページ)
  │─ projectd_laravel8(バックエンド)
  │─ projectd_nuxt3(フロントエンド)
  └─ sql_sample(テスト用SQL)
```

## 環境構築  
※本プロジェクトは[YOLOv5用サーバー](https://github.com/projectd-team14/yolov5-server)の環境構築が必要です。  
〇主要フレームワーク、ライブラリ、言語等  
・Nuxt.js(TypeScript,Sass)  
・Laravel(PHP)  
・YOLOv5(Python)
・Node.js  
〇使用ツール  
・Docker(必須)  
・Postman(APIテスト用、必須ではない)
  
1.リポジトリのclone
```
git clone https://github.com/projectd-team14/bicycle_system.git
```
2.bicycle_systemディレクトリに移動
```
cd bicycle_system
```
3.各ディレクトリでDockerイメージのビルド
```
cd projectd_Laravel8
docker compose up -d --build
```
```
cd_projectd_nuxt3
docker compose up -d --build
```
4-1.projectd_nuxt3のコンテナに接続(projectd_nuxt3ディレクトリで行う)
```
docker-compose exec app sh
yarn install
```
4-2.サーバーを起動
```
yarn dev
```
6.終了コマンド
```
Ctrl + C
exit
```
## APIの仕様
・ユーザー登録
```
POST: http://localhost:8000/api/register
{
  "name" : "0000"
  "email" : "0000@example.com",
  "password" : "0000example"
}
```
・ログイン
```
POST: http://localhost:8000/api/login
{
  "email" : "0000@example.com",
  "password" : "0000example"
}
```
・登録（駐輪場、カメラ、ラベル範囲）
```
POST: http://localhost:8000/api/store_spot/ユーザーID
{
  "spots_name" : "文教大学駐輪場A",
  "spots_address" : "神奈川県茅ケ崎市行谷1100",
  "spots_img" : "画像のアップロード"
}
POST: http://localhost:8000/api/store_camera/駐輪場ID
{
  "spots_name" : "カメラA",
  "spots_url" : "YoutubeURL、動画URL",
  "spots_address" : "神奈川県茅ケ崎市行谷1100"
}
POST: http://localhost:8000/api/labels/駐輪場ID
{
  "label_mark" : "A",
  "label_point1X" : 0,
  "label_point1Y" : 350,
  "label_point2X" : 0,
  "label_point2Y" : 600,
  "label_point3X" : 625,
  "label_point3Y" : 675,
  "label_point4X" : 700,
  "label_point4Y" : 600
}
```
・スタート
```
POST: http://localhost:8000/api/start/カメラID
```
・ストップ
```
POST: http://localhost:8000/api/stop/カメラID
```
・表データ
```
GET: http://localhost:8000/api/get_stop/駐輪場ID
{
	"situationChartData":[
		{
			"label": "1日間",
			"backgroundColor": "#f87979",
			"data": [43,43,43,43,43,43,43,54,73,80,80,77,89,73,80,80,77,60,60,60,60,60,60,40,99],
			"labels": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
		},
		{
			"label": "1週間",
			"backgroundColor": "#f87979",
			"data": [55,55,55,55,55,55,66],
			"labels":　[1,2,3,4,5,6,7]
		},
		{
			"label": "1か月間",
			"backgroundColor": "#f87979",
			"data": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],
			"labels": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
		},
		{
			"label": "3か月間",
			"backgroundColor": "#f87979",
			"data": [0,10,20,30,40,50,60,70,80,90],
			"labels": ["","","","6/19","","","7/19","","","8/19"]
		}
	],
	"numberChartData":[
		{
			"label": "1日間",
			"backgroundColor": "#f87979",
			"data": [10,20,40,45,15,40,30,40,45,15,40,10]
		},
		{
			"label": "1週間",
			"backgroundColor": "#f87979",
			"data": [10,20,40,45,15,40,30,40,45,15,40,10]
		},
		{
			"label": "1か月間",
			"backgroundColor": "#f87979",
			"data": [10,20,40,45,15,40,30,40,45,15,40,10]
		},
		{
			"label": "3か月間",
			"backgroundColor": "#f87979",
			"data": [10,20,40,45,15,40,30,40,45,15,40,10]
		}
	]
}
```
・管理データ
```
GET: http://localhost:8000/api/get_all/ユーザーID
[
    {
       "row":"A",
       "bicycle":[
          20,26,34,12,14,23,17,15,43
       ]
    },
    {
       "row":"0",
       "bicycle":[]
    },
    {
       "row":"B",
       "bicycle":[
          1,2,3,4,5,6,7,8,9,0,23,35
       ]
    },
    {
       "row":"0",
       "bicycle":[]
    },
    {
       "row":"C",
       "bicycle":[
          1,2
       ]
    }
]
```
## その他 
〇連携前の個別リポジトリ  
・[フロントエンド](https://github.com/Ban-c0p31073/Pro14_Nuet)  
・[バックエンド](https://github.com/nishiumidaina/projectd_docker_laravel8)  



