# YOLOv5を用いた駐輪場管理業務支援システム(bicycle-system)
Bicycle parking lot management system using YOLOv5  
## ディレクトリ構成  
```
bicycle-system
  │─ projectd_laravel8(バックエンド)
  │─ projectd_nuxt3(フロントエンド)
  └─ sql_sample(テスト用SQL)
```
## URL
フロントエンド：[http://localhost:3000](http://localhost:3000/login)  
バックエンド：[http://localhost:8000](http://localhost:8000)  
phpMyAdmin：[http://localhost:8080](http://localhost:8080)  
## 環境構築  
※本プロジェクトは[YOLOv5用サーバー](https://github.com/projectd-team14/yolov5-server)の環境構築が必要です。  
〇主要フレームワーク、ライブラリ、言語等  
・Nuxt.js(Vue.js,Node.js,TypeScript,Sass)  
・Laravel(PHP, Nginx, PHP-FPM, MySQL)  
・YOLOv5(FastAPI, YOLOv5 ※別のインスタンスに設置)  
  
1.リポジトリのclone
```
git clone https://github.com/projectd-team14/bicycle_system.git
```
2.bicycle_systemディレクトリに移動
```
cd bicycle_system
```
3-1.バックエンド用ディレクトリでDockerイメージのビルド
```
cd projectd_Laravel8
docker compose up -d --build
docker compose exec php sh
cd laravel8-api
composer install
```
4-2.worker(ワーカー)を起動
```
php artisan queue:work
```
4-1.フロントエンド用ディレクトリでDockerイメージのビルド
```
cd_projectd_nuxt3
docker compose up -d --build  
docker compose exec app sh
yarn install
```
4-2.サーバーを起動
```
yarn dev
```
6.終了
```
Ctrl + C
exit
```











