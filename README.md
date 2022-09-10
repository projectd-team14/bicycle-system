# YOLOv5を用いた駐輪場管理業務支援システム(bicycle_system)
Bicycle parking lot management system using YOLOv5
※本プロジェクトはDockerコンテナを3つ使用して、ローカルサーバーを3台起動させるため非常に重いです。(とくにPython用サーバーが重い)

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
docker compose up -d --build
```
4-1.projectd_nuxt3のコンテナに接続(projectd_nuxt3ディレクトリで行う)
```
docker-compose exec app sh
yarn install
```
4-2サーバーを起動
```
yarn dev
```
5-1projectd_python3のコンテナに接続(projectd_python3ディレクトリで行う)
```
docker container exec -it projectd_docker_python3-python3-1 bash
cd src
pip install -r requirements.txt
```
5-2.恐らくライブラリをインストールした後サーバーを起動すると正常に機能しません（エラーは出ないけどYOLOが動いていない状態になる）。 そこでpythonのライブラリを一部コメントアウトする必要がある。
```
2行をコメントアウト↓
 File "/usr/local/lib/python3.10/site-packages/pafy/backend_youtube_dl.py", line 53
 File "/usr/local/lib/python3.10/site-packages/pafy/backend_youtube_dl.py", line 54
```
