import os
import pafy
import cv2
from fastapi import FastAPI
import asyncio
import subprocess
from subprocess import PIPE
from time import sleep
import datetime
import mysql.connector

app = FastAPI()
count=0

def time_cycle():
    global count
    count = 1
    #sleepで定期実行
    while True:
        proc = subprocess.run(['python','Python/Yolov5_DeepSort_Pytorch_test/count.py'], stdout=PIPE, stderr=PIPE)        
        print("update")
        sleep(3600)

@app.get("/")
async def root(label: int = 0, id: int = 0):
    conn = mysql.connector.connect(
        host='host.docker.internal',
        port='3306',
        user='user',
        password='password',
        database='laravel_project'
    )

    if label == 0:
        subprocess.Popen('python ./Python/Yolov5_DeepSort_Pytorch_test/start.py',shell=True)
        if count == 0:
            asyncio.new_event_loop().run_in_executor(None, time_cycle)
            print("START")
    else:
        cur = conn.cursor(buffered=True)
        cur.execute("SELECT cameras_url FROM cameras WHERE cameras_id = %s" % id)
        db_lis = cur.fetchall()

        dir_path = './Python/label_imgs'
        ext = 'jpg'

        video = pafy.new(db_lis[0][0])
        best = video.getbest(preftype="mp4")
        cap = cv2.VideoCapture(best.url)

        if not cap.isOpened():
            return
        os.makedirs(dir_path, exist_ok=True)
        base_path = os.path.join(dir_path, str(id))

        ret, frame = cap.read()
        cv2.imwrite('{}.{}'.format(base_path, ext), frame)

        return "/Python/%s.jpg" % id