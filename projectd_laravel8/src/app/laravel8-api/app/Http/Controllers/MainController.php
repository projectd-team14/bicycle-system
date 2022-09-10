<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Spot;
use App\Models\Label;
use App\Models\Bicycle;
use App\Models\Violation;
use App\Models\Camera;

class HomeController extends Controller
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
        $Camera = Camera::where('users_id', $user['id'])->get();
        return view('home', compact('user', 'cameras','camera'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    //駐輪場を登録,idはusers_id
    public function store_spot(Request $request, $id)
    {
        //
        $data = $request->all();
        $query = $data['spots_address'];
        $query = urlencode($query);
        $url = "http://www.geocoding.jp/api/";
        $url.= "?v=1.1&q=".$query;
        $line="";
        $fp = fopen($url, "r");
        while(!feof($fp)) {
            
            $line.= fgets($fp);
        }
        fclose($fp);
        $xml = simplexml_load_string($line);
        $insert_long = (string) $xml->coordinate->lng;
        $insert_lat= (string) $xml->coordinate->lat;
        $spot_id = Spot::insertGetId([
             'spots_name' => $data['spots_name'],
             'users_id' => $id, 
             'spots_longitude' => $insert_long, 
             'spots_latitude' => $insert_lat,
             'spots_address' => $data['spots_address'],
             'spots_status' => 'None',
             'spots_count' => 0,
             'spots_over_time' => 60,
             'spots_img' => '画像のパスが入ります',
        ]);
        return $data;
    }
     //カメラを登録,idはspots_id
    public function store_camera(Request $request, $id)
    {
        $data = $request->all();
        $camera_id = Camera::insertGetId([
             'cameras_name' => $data['cameras_name'],
             'spots_id' => $id, 
             'cameras_url' => $data['cameras_url'],
             'cameras_status' => 'None',
             'cameras_count' => 0,
        ]);
        return $data;
    }
    
    public function labels(Request $request, $id)
    {
        $data = $request->all();
        $mark = $data['label_mark'];
        $data_str = json_encode($data);

        //$jsonObject=json_decode(file_get_contents($data),true);
        $label_data = Label::insertGetId([
            'cameras_id' => $id,
            'labels_json' => $data_str,

        ]);
        return  "ラベリングデータ $mark を登録しました";
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit_spot($id){
        $cameras = Spot::where('users_id', $id)->get();
        return $cameras;
    }

    public function edit_camera($id){
        $cameras = Camera::where('spots_id', $id)->get();
        return $cameras;
    }

    public function violation($id){
        $violation_bicycles = Violation::where('cameras_id', $id)->get();
        return $violation_bicycles;
    }
    public function bicycle($id){
        $violation_bicycles = Bicycle::where('cameras_id', $id)->get();
        return $violation_bicycles;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function delete_spot(Request $request, $id)
    {
        $inputs = $request->all();
         Spot::where('spots_id', $id)->delete();
         Camera::where('spots_id', $id)->delete();
        return "削除完了";
    }
    public function delete_camera(Request $request, $id)
    {
        $inputs = $request->all();
         Camera::where('cameras_id', $id)->delete();
        return "削除完了";
    }

    #スタートボタンidはcameras_id
    public function start(Request $request, $id)
    {
        $inputs = $request->all();
        $cameras = Camera::where('cameras_id', $id)->get();
        $camera_lis =  json_decode($cameras , true); 
        //判定
        if ($cameras[0]["cameras_status"]=="Run" or $cameras[0]["cameras_status"]=="Run_process" or $cameras[0]["cameras_status"]=="Start"){
            return "処理中です";
        }else if ($cameras[0]["cameras_status"]=="None"){
           Camera::where('cameras_id', $id)->update(['cameras_status'=>'Start']);
           //実行ファイル
           $command = 'python C:\xampp\htdocs\bicycle_project_YOLOv5\laravel8-api\public\Python\Yolov5_DeepSort_Pytorch_test/start.py';
           popen('start "" ' . $command, 'r');
           return "処理を開始します";
        }
    }

    public function stop(Request $request, $id)
    {
        $inputs = $request->all();
        $cameras = Camera::where('cameras_id', $id)->get();
        $camera_lis =  json_decode($cameras , true); 
        //判定
        if ($cameras[0]["cameras_status"]=="Run_process"){
           Camera::where('cameras_id', $id)->update(['cameras_status'=>'Stop']); 
           return '処理を停止します';
        }else if ($cameras[0]["cameras_status"]=="Start" or $cameras[0]["cameras_status"]=="Stop"){
            Camera::where('cameras_id', $id)->update(['cameras_status'=>'None']);
            return '無効な処理です';
        }
        else{
            return '処理が開始されていません';
        }
    }

    //ここから本番用
    //駐輪情報
    public function get_spot($id){
        $cameras = Spot::where('users_id', $id)->get();
        return $cameras;
    }

    /*テスト用
    
    */
    public function test()
    {
        $test = "Apiの動作テスト";
        return $test;
    }
}
