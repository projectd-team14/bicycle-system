import subprocess
import mysql.connector

# コネクション作成
conn = mysql.connector.connect(
    host='host.docker.internal',
    port='3306',
    user='user',
    password='password',
    database='laravel_project'
)

# 接続状況確認
print(conn.is_connected())
cur = conn.cursor(buffered=True)
cur.execute("SELECT cameras_id, cameras_name, cameras_status, cameras_url FROM cameras")
db_lis = cur.fetchall()
print(db_lis)
# DB操作終了
cur.close()
for i in range(len(db_lis)):
    url = db_lis[i][3]
    if db_lis[i][2] == 'Start':
        #BDの値を変更
        cur = conn.cursor(buffered=True)
        sql = ("UPDATE cameras SET cameras_status = %s WHERE cameras_id = %s")
        param = ('Run',db_lis[i][0])
        cur.execute(sql,param)
        conn.commit()
        cur.close()
        camera_id = db_lis[i][0]        
        N = subprocess.Popen('python ./Yolov5_DeepSort_Pytorch_test/main.py --save-crop --source "%s" --camera_id %s --yolo_model ./Yolov5_DeepSort_Pytorch_test/model_weight/best.pt' % (url,int(camera_id)),shell=True)
