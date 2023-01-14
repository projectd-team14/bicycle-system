<?php

namespace App\Http\Controllers\Camera;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Camera;
use App\Models\Bicycle;
use App\Jobs\CreateCameraJob;

class CameraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = \Auth::user();
        $cameras = Camera::where('users_id', $user['id'])->get();

        return view('home', compact('user', 'cameras','camera'));
    }

    public function editCamera($id){
        $cameras = Camera::where('spots_id', $id)->get();

        return $cameras;
    }

    //カメラを登録,idはspots_id
    public function storeCamera(Request $request, $id)
    {
        $data = $request->all();

        // XSS対策（攻撃そのものの対策ではなく、HTMLタグをDBやレスポンスに含めないようにする）
        if ($this->htmlValidation($data)) {
            return '使用できない文字が含まれています';
        }
                
        $cameraId = Camera::insertGetId([
            'cameras_name' => $data['cameras_name'],
            'spots_id' => $id, 
            'cameras_url' => $data['cameras_url'],
            'cameras_status' => 'Stop',
            'cameras_count' => 0,
        ]);
        
        $this->createCameraLog($data);

        return $data;
    }

    public function deleteCamera(Request $request, $id)
    {
        $inputs = $request->all();
         Camera::where('cameras_id', $id)->delete();

        return "削除完了";
    }

    #スタートボタンidはcameras_id
    public function start($id)
    {
        $cameras = Camera::where('cameras_id', $id)->get();
        $serverCondition = Bicycle::where('cameras_id', $id)->exists();

        if ($cameras[0]["cameras_status"] == "Run") {
            return "処理中です";
        } else {
           Camera::where('cameras_id', $id)->update(['cameras_status'=>'Run']);
           //PythonAPI
           // $url = "https://projectd-fastapi.herokuapp.com/detect/?id=${id}";
           $ipAddress = env('LARAVEL_URL');

           if (!$serverCondition) {
                $url = "${ipAddress}/detect/?id=${id}&status=0";
                $conn = curl_init();
                curl_setopt($conn, CURLOPT_URL, $url);
                curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
                $res =  curl_exec($conn);
                curl_close($conn);
           } else{
                // メンテナンスまたはサーバーダウン後の修復処理
                $url = "${ipAddress}/detect/?id=${id}&status=1";
                $conn = curl_init();
                curl_setopt($conn, CURLOPT_URL, $url);
                curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
                $res =  curl_exec($conn);
                curl_close($conn);
           }

           return "処理を開始します";
        }
    }

    public function stop($id)
    {
        $cameras = Camera::where('cameras_id', $id)->get();
        if ($cameras[0]["cameras_status"]=="Run"){
           Camera::where('cameras_id', $id)->update(['cameras_status'=>'Stop']); 

           return '処理を停止します';
        } else {
            return '処理が開始されていません';
        }
    }

    private function htmlValidation($data)
    {
        $xssData = array_values($data);

        for ($i = 0; $i < count($xssData); $i++) {
            if (preg_match('/<.*>/', $xssData[$i])) {
                return true;
            }
        }

        return false;
    }

    private function createCameraLog($data)
    {
        CreateCameraJob::dispatch($data);
    }
}

