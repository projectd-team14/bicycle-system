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
             'spots_count_day1' => 'None',
             'spots_count_week1' => 'None',
             'spots_count_month1' => 'None',
             'spots_count_month3' => 'None',
             'spots_max' => 100,
             'spots_over_time' => 3600,
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
           //PythonAPI
           $url = "host.docker.internal:9000";
           $conn = curl_init(); #cURLセッションの初期化
           curl_setopt($conn, CURLOPT_URL, $url); #取得するURLを指定
           curl_setopt($conn, CURLOPT_RETURNTRANSFER, true); #実行結果を文字列で返す。
           $res =  curl_exec($conn);
           var_dump($res);
           curl_close($conn); #セッションの終了
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

    //動作テスト用
    public function test()
    {
        $test = "Apiの動作テスト";
        return $test;
    }


       //ここから本番用
    //駐輪情報
    public function get_spot($id){
        //DB
        $spots = Spot::where('spots_id', $id)->get();
        $bicycles = Bicycle::where('spots_id', $id)->get();

        $day1_str = explode(",",$spots[0]["spots_count_day1"]);
        $day1_int = array_map('intval', $day1_str);
        $day1_count = count($day1_int);
        $week1_str = explode(",",$spots[0]["spots_count_week1"]);
        $week1_int = array_map('intval', $week1_str);
        $week1_count = count($week1_int);
        $month1_str = explode(",",$spots[0]["spots_count_month1"]);
        $month1_int = array_map('intval', $month1_str);
        $month1_count = count($month1_int);
        $month3_str = explode(",",$spots[0]["spots_count_month3"]);
        $month3_int = array_map('intval', $month3_str);
        $month3_count = count($month3_int);
        //json化
        $data_day1 = [
            "label" => "1日間",
            "backgroundColor" => "#f87979",
            "data" => $day1_int,
            "labels" => range(1, $day1_count)
        ];
        $data_week1 = [
            "label" => "1週間",
            "backgroundColor" => "#f87979",
            "data" => $week1_int,
            "labels" => range(1, $week1_count)
        ];
        $data_month1 = [
            "label" => "1か月間",
            "backgroundColor" => "#f87979",
            "data" => $month1_int,
            "labels" => range(0, $month1_count)
        ];
        $data_month3 = [
            "label" => "３か月間",
            "backgroundColor" => "#f87979",
            "data" => $month3_int,
            "labels" => range(1, $month3_count)
        ];
        $data_all1 = [
            $data_day1,
            $data_week1,
            $data_month1,
            $data_month3
        ];

        //numberChartData
        $day1_data = [0,0,0,0,0,0,0,0,0,0,0];
        $week1_data = [0,0,0,0,0,0,0,0,0,0,0];
        $month1_data = [0,0,0,0,0,0,0,0,0,0,0];
        $month3_data = [0,0,0,0,0,0,0,0,0,0,0];
        $time_bicycle_lis=[];
        for($i=0;$i<count($bicycles);$i++){
            //放置時間(秒)
            $time_bicycle = strtotime($bicycles[$i]['updated_at'])-strtotime($bicycles[$i]['created_at']);
            for($i2=0;$i2<count($data_day1);$i2++){
                if ($time_bicycle>=($i2)*3600 and $time_bicycle<($i2+1)*3600){
                    $day1_data[$i2] = $day1_data[$i2] + 1;
                }
            }
        }

        $data_day1 = [
            "label" => "1日間",
            "backgroundColor" => "#f87979",
            "data" => $day1_data,
        ];
        $data_week1 = [
            "label" => "1週間",
            "backgroundColor" => "#f87979",
            "data" => $week1_data,
        ];
        $data_month1 = [
            "label" => "1か月間",
            "backgroundColor" => "#f87979",
            "data" => $month1_data,
        ];
        $data_month3 = [
            "label" => "３か月間",
            "backgroundColor" => "#f87979",
            "data" => $month3_data,
        ];       
        $data_all2 = [
            $data_day1,
            $data_week1,
            $data_month1,
            $data_month3
        ];
        return response()->json(
            [
                'situationChartData' => $data_all1,
                "numberChartData" => $data_all2
            ]
        );
    }
    //全情報
    public function get_all($id){
        $users = Spot::where('users_id', $id)->get();
        $spots_id_lis = [];
        $spots_data_all = [];
        for($i=0;$i<count($users);$i++){
            array_push($spots_id_lis,$users[$i]['spots_id']); 
        }

        for($i3=0;$i3<count($spots_id_lis);$i3++){
            $spots_id= $spots_id_lis[$i3];
            $spots = Spot::where('spots_id', $spots_id)->get();
            $day1_str = explode(",",$spots[0]["spots_count_day1"]);
            $day1_int = array_map('intval', $day1_str);
            $camera_all = Camera::where('spots_id', $spots_id)->get(['cameras_id','cameras_name','cameras_url']);
            $bicycles = Bicycle::where('spots_id', $spots_id)->whereIn('bicycles_status', ['None','違反'])->get();
            $violation = Violation::where('spots_id', $spots_id)->get();
            //cameraの項目
            $camera_new=[];
            if (count($camera_all)==0){
                for($i=0;$i<=count($camera_all);$i++){
                    $camera_new[$i]= [
                        'id' => [],
                        'name' => [],
                        'url' => [],
                    ];
                }
            } else{
                for($i=0;$i<count($camera_all);$i++){
                    $camera_new[$i]= [
                        'id' => $camera_all[$i]['cameras_id'],
                        'name' => $camera_all[$i]['cameras_name'],
                        'url' => $camera_all[$i]['cameras_url'],
                    ];
                }
            }
            //situationの項目
            $label_names =[];
            for($i=0;$i<count($bicycles);$i++){
                if (!(in_array($bicycles[$i]['labels_name'],$label_names))) {
                   array_push($label_names,$bicycles[$i]['labels_name']); 
                }
            }
            $label_names_new = array_unique($label_names);
    
            if (count($label_names_new)==0){
                for($i=0;$i<=count($label_names_new);$i++){
                    $situation[$i]= [
                        'row' => [],
                        'bicycle' => [],
                    ];
                }
            } else{
                for($i=0;$i<count($label_names_new);$i++){
                    $bicycle = Bicycle::where('spots_id', $spots_id)->where('labels_name',$label_names_new[$i])->get(['bicycles_id','updated_at','created_at','bicycles_status','bicycles_img']);
    
                    for($i2=0;$i2<count($bicycle);$i2++){
                        if ($bicycle[$i2]['bicycles_status'] == 'None'){
                            $bicycle[$i2]['bicycles_status'] = false;
                        } elseif ($bicycle[$i2]['bicycles_status'] == '違反'){
                            $bicycle[$i2]['bicycles_status'] = true;
                        } else{
                            $bicycle[$i2]['bicycles_status'] = false;
                        }
                        $time = strtotime($bicycle[$i2]['updated_at'])-strtotime($bicycle[$i2]['created_at']);
                        $bicycle_new[$i2]= [
                            'id' => $bicycle[$i2]['bicycles_id'],
                            'time' => $time,
                            'violatin_status' => $bicycle[$i2]['bicycles_status'],
                            'violatin_img' => $bicycle[$i2]['bicycles_img'],
                        ];
                    }
                    $situation[$i]= [
                        'row' => $label_names_new[$i],
                        'bicycle' => $bicycle_new,
                    ];
                }
            }
            $all_data = [
                'id' => $spots[0]['spots_id'],
                'name' => $spots[0]['spots_name'],
                'address' => $spots[0]['spots_address'],
                'latitude' => $spots[0]['spots_latitude'],
                'longitude' => $spots[0]['spots_longitude'],
                'max' => $spots[0]['spots_max'],
                'count' => end($day1_int),
                'overtime' => $spots[0]['spots_over_time'],
                'img'=> $spots[0]['spots_img'],
                'camera' => $camera_new,
                'situation' => $situation
            ];
            array_push($spots_data_all,$all_data);
            unset($all_data);
            unset($situation);
            unset($camera_new);
        }

        return $spots_data_all;

    }
    public function open_api(){
        $spots = Spot::get();
        $spot_lis_all = [];
        for ($i=0; $i<count($spots); $i++){
            $day1_str = explode(",",$spots[$i]["spots_count_day1"]);
            $day1_int = array_map('intval', $day1_str);
            $spots_average = $day1_int[count($day1_int)-1];
            $spots_count = count(Bicycle::where('spots_id', $spots[$i]['spots_id'])->orWhere('bicycles_status', 'None')->orWhere('bicycles_status', '違反')->get(['bicycles_id']));
            $spot_lis = [
                'id' => $spots[$i]['spots_id'],
                'spots_name' => $spots[$i]['spots_name'],
                'spots_max' => $spots[$i]['spots_max'],
                'spots_latitude' => $spots[$i]['spots_latitude'],
                'spots_longitude' => $spots[$i]['spots_longitude'],
                'spots_address' => $spots[$i]['spots_address'],
                'spots_count' => $spots_count,
                'spots_average' => $spots_average
            ];
            array_push($spot_lis_all,$spot_lis);
        }
        return $spot_lis_all;
    }
}

