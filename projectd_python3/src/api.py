from fastapi import FastAPI
import subprocess
from subprocess import PIPE
import asyncio
from time import sleep

app = FastAPI()
count=0

def time_cycle():
    global count
    count = 1
    #sleepで定期実行
    while True:
        proc = subprocess.run(['python','Python/Yolov5_DeepSort_Pytorch_test/count.py'], stdout=PIPE, stderr=PIPE)        
        #proc_str = proc.stdout.decode('utf-8').split()
        print("update")
        sleep(3600)

@app.get("/")
async def root():
    subprocess.Popen('python ./Python/Yolov5_DeepSort_Pytorch_test/start.py',shell=True)
    if count == 0:
        asyncio.new_event_loop().run_in_executor(None, time_cycle)
        print("OK")