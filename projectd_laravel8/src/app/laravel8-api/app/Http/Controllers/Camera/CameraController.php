<?php

namespace App\Http\Controllers\Camera;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Camera;

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

    public function edit_camera($id){
        $cameras = Camera::where('spots_id', $id)->get();

        return $cameras;
    }

    //カメラを登録,idはspots_id
    public function store_camera(Request $request, $id)
    {
        $data = $request->all();
        $cameraId = Camera::insertGetId([
            'cameras_name' => $data['cameras_name'],
            'spots_id' => $id, 
            'cameras_url' => $data['cameras_url'],
            'cameras_status' => 'Stop',
            'cameras_count' => 0,
        ]);
        return $data;
    }

    public function delete_camera(Request $request, $id)
    {
        $inputs = $request->all();
         Camera::where('cameras_id', $id)->delete();

        return "削除完了";
    }

    #スタートボタンidはcameras_id
    public function start($id)
    {
        $cameras = Camera::where('cameras_id', $id)->get();
        if ($cameras[0]["cameras_status"]=="Run"){
            return "処理中です";
        } else {
           Camera::where('cameras_id', $id)->update(['cameras_status'=>'Run']);
           //PythonAPI
           // $url = "https://projectd-fastapi.herokuapp.com/detect/?id=${id}";
           $url = "host.docker.internal:9000/detect/?id=${id}";
           $conn = curl_init();
           curl_setopt($conn, CURLOPT_URL, $url);
           curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
           $res =  curl_exec($conn);
           curl_close($conn);

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
}

