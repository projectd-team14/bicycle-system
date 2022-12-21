# YOLOv5を用いた駐輪場管理業務支援システム(bicycle-system)
Bicycle parking lot management system using YOLOv5  
## ディレクトリ構成  
```
bicycle-system
  │─ projectd_laravel8(バックエンド)
  │─ projectd_nuxt3(フロントエンド)
  └─ sql_sample(テスト用SQL)
```

## 環境構築  
※本プロジェクトは[YOLOv5用サーバー](https://github.com/projectd-team14/yolov5-server)の環境構築が必要です。  
〇主要フレームワーク、ライブラリ、言語等  
・Nuxt.js(Vue.js,Node.js,TypeScript,Sass)  
・Laravel(PHP)  
・YOLOv5(Python)  
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
4-1.projectd_laravel8のコンテナに接続(projectd_laravel8ディレクトリで行う)
```
docker container exec -it projectd_laravel8-php-1 bash
cd laravel8-api
composer install
```
4-2.projectd_nuxt3のコンテナに接続(projectd_nuxt3ディレクトリで行う)
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
## その他 
〇連携前の個別リポジトリ  
・[フロントエンド](https://github.com/Ban-c0p31073/Pro14_Nuet)  
・[バックエンド](https://github.com/nishiumidaina/projectd_docker_laravel8)  











