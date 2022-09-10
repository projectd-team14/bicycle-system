# YOLOv5を用いた駐輪場管理業務支援システム(bicycle_system)
Bicycle parking lot management system using YOLOv5

## 環境構築
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
cd projectd_python3
docker compose up -d --build
```
```
cd_projectd_nuxt3
docker-compose exec app sh
```
