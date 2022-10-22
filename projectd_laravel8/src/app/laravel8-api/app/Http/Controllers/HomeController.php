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
     * 
     * 駐輪場を登録,idはusers_id
     */
    public function store_spot(Request $request, $id)
    {
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
        $insertLong = (string) $xml->coordinate->lng;
        $insertLat= (string) $xml->coordinate->lat;
        $spotId = Spot::insertGetId([
             'spots_name' => $data['spots_name'],
             'users_id' => $id, 
             'spots_longitude' => $insertLong, 
             'spots_latitude' => $insertLat,
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
        $cameraId = Camera::insertGetId([
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
        $dataStr = json_encode($data);
        $labelData = Label::insertGetId([
            'cameras_id' => $id,
            'labels_json' => $dataStr,

        ]);

        return  "ラベリングデータ $mark を登録しました";
    }

    public function labels_img($id)
    {
        //PythonAPI
        $url = "host.docker.internal:9000/?label=1&id=${id}";
        $conn = curl_init();
        curl_setopt($conn, CURLOPT_URL, $url);
        curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
        $res =  curl_exec($conn);
        curl_close($conn);

        return  $res;
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
        $violationBicycles = Violation::where('cameras_id', $id)->get();

        return $violationBicycles;
    }
    
    public function bicycle($id){
        $bicycles = Bicycle::where('cameras_id', $id)->get();

        return $bicycles;
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
        $cameraLis =  json_decode($cameras , true); 
        if ($cameras[0]["cameras_status"]=="Run" or $cameras[0]["cameras_status"]=="Run_process" or $cameras[0]["cameras_status"]=="Start"){
            return "処理中です";
        }else if ($cameras[0]["cameras_status"]=="None"){
           Camera::where('cameras_id', $id)->update(['cameras_status'=>'Start']);
           //PythonAPI
           $url = "host.docker.internal:9000/detect/?id=${id}";
           $conn = curl_init();
           curl_setopt($conn, CURLOPT_URL, $url);
           curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
           $res =  curl_exec($conn);
           curl_close($conn);

           return "処理を開始します";
        }
    }

    public function stop(Request $request, $id)
    {
        $inputs = $request->all();
        $cameras = Camera::where('cameras_id', $id)->get();
        $cameraLis =  json_decode($cameras , true); 
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

    //駐輪情報
    public function get_spot($id){
        $spots = Spot::where('spots_id', $id)->get();
        $bicycles = Bicycle::where('spots_id', $id)->get();
        $day1Str = explode(",",$spots[0]["spots_count_day1"]);
        $day1Int = array_map('intval', $day1Str);
        $day1Count = count($day1Int);
        $week1Str = explode(",",$spots[0]["spots_count_week1"]);
        $week1Int = array_map('intval', $week1Str);
        $week1Count = count($week1Int);
        $month1Str = explode(",",$spots[0]["spots_count_month1"]);
        $month1Int = array_map('intval', $month1Str);
        $month1Count = count($month1Int);
        $month3Str = explode(",",$spots[0]["spots_count_month3"]);
        $month3Int = array_map('intval', $month3Str);
        $month3Count = count($month3Int);
        $dataDay1 = [
            "label" => "1日間",
            "backgroundColor" => "#f87979",
            "data" => $day1Int,
            "labels" => range(1, $day1Count)
        ];
        $dataWeek1 = [
            "label" => "1週間",
            "backgroundColor" => "#f87979",
            "data" => $week1Int,
            "labels" => range(1, $week1Count)
        ];
        $dataMonth1 = [
            "label" => "1か月間",
            "backgroundColor" => "#f87979",
            "data" => $month1Int,
            "labels" => range(0, $month1Count)
        ];
        $dataMonth3 = [
            "label" => "３か月間",
            "backgroundColor" => "#f87979",
            "data" => $month3Int,
            "labels" => range(1, $month3Count)
        ];
        $dataAll1 = [
            $dataDay1,
            $dataWeek1,
            $dataMonth1,
            $dataMonth3
        ];
        //numberChartData
        $numberChartDataDay1 = [0,0,0,0,0,0,0,0,0,0,0];
        $numberChartDataWeek1 = [0,0,0,0,0,0,0,0,0,0,0];
        $numberChartDataMonth1 = [0,0,0,0,0,0,0,0,0,0,0];
        $numberChartDataMonth3 = [0,0,0,0,0,0,0,0,0,0,0];
        $time_bicycle_lis=[];
        for($i=0;$i<count($bicycles);$i++){
            $timeBicycle = strtotime($bicycles[$i]['updated_at'])-strtotime($bicycles[$i]['created_at']);
            for($i2=0;$i2<count($dataDay1);$i2++){
                if ($timeBicycle>=($i2)*3600 and $timeBicycle<($i2+1)*3600){
                    $numberChartDataDay1[$i2] = $numberChartDataDay1[$i2] + 1;
                }
            }
        }
        $dataDay1 = [
            "label" => "1日間",
            "backgroundColor" => "#f87979",
            "data" => $numberChartDataDay1,
        ];
        $dataWeek1 = [
            "label" => "1週間",
            "backgroundColor" => "#f87979",
            "data" => $numberChartDataWeek1,
        ];
        $dataMonth1 = [
            "label" => "1か月間",
            "backgroundColor" => "#f87979",
            "data" => $numberChartDataMonth1,
        ];
        $dataMonth3 = [
            "label" => "３か月間",
            "backgroundColor" => "#f87979",
            "data" => $numberChartDataMonth3,
        ];       
        $dataAll2 = [
            $dataDay1,
            $dataWeek1,
            $dataMonth1,
            $dataMonth3
        ];
        return response()->json(
            [
                'situationChartData' => $dataAll1,
                "numberChartData" => $dataAll2
            ]
        );
    }

    //全情報
    public function get_all($id){
        $users = Spot::where('users_id', $id)->get();
        $spotsIdLis = [];
        $spotsDataAll = [];
        for($i=0;$i<count($users);$i++){
            array_push($spotsIdLis,$users[$i]['spots_id']); 
        }
        for($i3=0;$i3<count($spotsIdLis);$i3++){
            $spotsId= $spotsIdLis[$i3];
            $spots = Spot::where('spots_id', $spotsId)->get();
            $day1Str = explode(",",$spots[0]["spots_count_day1"]);
            $day1Int = array_map('intval', $day1Str);
            $cameraAll = Camera::where('spots_id', $spotsId)->get(['cameras_id','cameras_name','cameras_url']);
            $bicycles = Bicycle::where('spots_id', $spotsId)->whereIn('bicycles_status', ['None','違反'])->get();
            $violation = Violation::where('spots_id', $spotsId)->get();
            //cameraの項目
            $cameraNew=[];
            if (count($cameraAll)==0){
                for($i=0;$i<=count($cameraAll);$i++){
                    $cameraNew[$i]= [
                        'id' => [],
                        'name' => [],
                        'url' => [],
                    ];
                }
            } else{
                for($i=0;$i<count($cameraAll);$i++){
                    $cameraNew[$i]= [
                        'id' => $cameraAll[$i]['cameras_id'],
                        'name' => $cameraAll[$i]['cameras_name'],
                        'url' => $cameraAll[$i]['cameras_url'],
                    ];
                }
            }
            //situationの項目
            $labelNames =[];
            for($i=0;$i<count($bicycles);$i++){
                if (!(in_array($bicycles[$i]['labels_name'],$labelNames))) {
                   array_push($labelNames,$bicycles[$i]['labels_name']); 
                }
            }
            $labelNamesNew = array_unique($labelNames);
    
            if (count($labelNamesNew)==0){
                for($i=0;$i<=count($labelNamesNew);$i++){
                    $situation[$i]= [
                        'row' => [],
                        'bicycle' => [],
                    ];
                }
            } else{
                for($i=0;$i<count($labelNamesNew);$i++){
                    $bicycle = Bicycle::where('spots_id', $spotsId)->where('labels_name',$labelNamesNew[$i])->get(['get_id','bicycles_id','updated_at','created_at','bicycles_status','bicycles_img']);
    
                    for($i2=0;$i2<count($bicycle);$i2++){
                        if ($bicycle[$i2]['bicycles_status'] == 'None'){
                            $bicycle[$i2]['bicycles_status'] = false;
                        } elseif ($bicycle[$i2]['bicycles_status'] == '違反'){
                            $bicycle[$i2]['bicycles_status'] = true;
                        } else{
                            $bicycle[$i2]['bicycles_status'] = false;
                        }
                        $time = strtotime($bicycle[$i2]['updated_at'])-strtotime($bicycle[$i2]['created_at']);
                        $bicycleNew[$i2]= [
                            'id' => $bicycle[$i2]['get_id'],
                            'time' => $time,
                            'violatin_status' => $bicycle[$i2]['bicycles_status'],
                            'violatin_img' => $bicycle[$i2]['bicycles_img'],
                        ];
                    }
                    $situation[$i]= [
                        'row' => $labelNamesNew[$i],
                        'bicycle' => $bicycleNew,
                    ];
                }
            }
            $allData = [
                'id' => $spots[0]['spots_id'],
                'name' => $spots[0]['spots_name'],
                'address' => $spots[0]['spots_address'],
                'latitude' => $spots[0]['spots_latitude'],
                'longitude' => $spots[0]['spots_longitude'],
                'max' => $spots[0]['spots_max'],
                'count' => end($day1Int),
                'overtime' => $spots[0]['spots_over_time'],
                'img'=> $spots[0]['spots_img'],
                'camera' => $cameraNew,
                'situation' => $situation
            ];
            array_push($spotsDataAll,$allData);
            unset($allData);
            unset($situation);
            unset($cameraNew);
        }

        return $spotsDataAll;

    }

    public function open_api(){
        $spots = Spot::get();
        $spotLisAll = [];
        for ($i=0; $i<count($spots); $i++){
            $day1Str = explode(",",$spots[$i]["spots_count_day1"]);
            $day1Int = array_map('intval', $day1Str);
            $spotsAverage = $day1Int[count($day1Int)-1];
            $spotsCount = count(Bicycle::where('spots_id', $spots[$i]['spots_id'])->orWhere('bicycles_status', 'None')->orWhere('bicycles_status', '違反')->get(['bicycles_id']));
            $spotLis = [
                'id' => $spots[$i]['spots_id'],
                'spots_name' => $spots[$i]['spots_name'],
                'spots_max' => $spots[$i]['spots_max'],
                'spots_latitude' => $spots[$i]['spots_latitude'],
                'spots_longitude' => $spots[$i]['spots_longitude'],
                'spots_address' => $spots[$i]['spots_address'],
                'spots_count' => $spotsCount,
                'spots_average' => $spotsAverage
            ];
            array_push($spotLisAll,$spotLis);
        }

        return $spotLisAll;
    }

    public function csv($id){
        // 出力情報の設定
        $bicycles = Bicycle::where('spots_id', $id)->select('bicycles_id','bicycles_status','created_at','updated_at')->get();
        header("Content-Type: application/octet-stream");
        header("Content-Disposition: attachment; filename=GRAYCODE.csv");
        header("Content-Transfer-Encoding: binary");

        $csv = null;
        // 1行目のラベルを作成
        $csv = '"ID","状態","登録日時","更新日時"' . "\n";
        // 出力データ生成
        foreach($bicycles as $value) {
            $csv .= '"' . $value['bicycles_id'] . '","' . $value['bicycles_status'] . '","' . $value['created_at'] . '","' . $value['updated_at'] . '"' . "\n";
        }
        $csvValue = mb_convert_encoding($csv, "SJIS", "UTF-8");
        return $csvValue;
    }

    //TGS用のバグ修正ボタン、YOLOが起動してるけど動かない時に押してください
    public function reset(){
        $resetCameras = Camera::where('cameras_status','Run_process')->orWhere('cameras_status','Run')->get();
        for ($i=0; $i<count($resetCameras); $i++){
            Camera::where('cameras_id', $resetCameras[$i]['cameras_id'])->update(['cameras_status'=>'None']); 
            bicycle::where('cameras_id', $resetCameras[$i]['cameras_id'])->delete();
        }

        return '強制終了';
    }
}

