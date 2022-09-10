# projectd_docker_laravel8
このリポジトリはYOLOv5を使用した駐輪場管理システムのバックエンドリポジトリです。  
Googleドライブのシステム関連/バックエンドに同様のzipを置いています。  
※Googleドライブは最新ではない可能性があるのでダウンロード時は確認をお願いいたします。
## ディレクトリ構成（重要部分のみ記載）
```
projectd_docker_laravel8.  
　　　|-python-api.（Python関連のディレクトリ）  
　　　|-src.  
　　　　　|-app.（Laravel関連のディレクトリ）
```
## 環境構築
1.Dockerを起動して以下のコマンドを実行します。  
```
docker compose up -d --build
```

※Pythonについて...  
Dockerのコンテナを分ける関係でPHPからPythonを起動する工程が必要となります。  
現在はホストマシンにあるPythonを利用しているためPythonと必要なライブラリをインストールします。  
今後dockerに移すかもしれません...

2.python-apiディレクトリで以下のコマンドを実行します。（Dockerのコンテナ内ではないので注意！）  
```
pip install -r requirements.txt
```
## 動作環境
1.Dockerのコンテナを起動します。  
2.PythonのAPI用サーバーを起動するために以下のコマンドをpython-apiディレクトリで実行します。
```
uvicorn api:app --port=8090
```
## Port（Dockerでも確認できます）
PHPMyAdmine
```
http://localhost:8080/
```
Laravel8（基本起動しているだけでOK）
```
http://localhost:8000/
```
MySQL（基本起動しているだけでOK）
```
http://localhost:3306/
```
