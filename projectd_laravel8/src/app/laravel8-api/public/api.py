from fastapi import FastAPI
import subprocess

app = FastAPI()

@app.get("/")
async def root():
    res = subprocess.Popen('python /Users/nishiumidaina/Desktop/projectd/src/app/laravel8-api/public/Python/Yolov5_DeepSort_Pytorch_test/start.py',shell=True)
    return {"message": "Hello World"}