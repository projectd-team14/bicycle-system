<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Spot;
use App\Models\Bicycle;
use App\Models\Camera;


class MainController extends Controller
{
    //駐輪情報
    public function getSpot($id){
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
            "labels" => range(1, $month1Count)
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
        $numberChartDataDay1 = [0,0,0,0,0,0,0,0,0,0,0,0];
        $numberChartDataWeek1 = [0,0,0,0,0,0,0,0,0,0,0,0];
        $numberChartDataMonth1 = [0,0,0,0,0,0,0,0,0,0,0,0];
        $numberChartDataMonth3 = [0,0,0,0,0,0,0,0,0,0,0,0];

        for ($i=0; $i < count($numberChartDataDay1) - 1; $i++) {
            for ($j=0; $j < count($bicycles); $j++) {
                $timeBicycle = (strtotime($bicycles[$j]['updated_at']) - strtotime($bicycles[$j]['created_at'])) / 3600 ;
                if ($timeBicycle >= $i && $timeBicycle < $i+1) {
                    $numberChartDataDay1[$i] += 1;
                }
            }
        }
        
        for ($i=0; $i < count($bicycles); $i++) {
            $timeBicycle = (strtotime($bicycles[$i]['updated_at']) - strtotime($bicycles[$i]['created_at'])) / 3600 ;
            if ($timeBicycle>=10) {
                $numberChartDataDay1[11] += 1;
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
    public function getAll($id){
        $users = Spot::where('users_id', $id)->get();
        $spotsIdLis = [];
        $spotsDataAll = [];
        for ($i=0; $i<count($users); $i++) {
            array_push($spotsIdLis,$users[$i]['spots_id']); 
        }
        for ($j=0; $j < count($spotsIdLis); $j++){
            $spotsId= $spotsIdLis[$j];
            $spots = Spot::where('spots_id', $spotsId)->get();
            $day1Str = explode(",",$spots[0]["spots_count_day1"]);
            $day1Int = array_map('intval', $day1Str);
            $cameraAll = Camera::where('spots_id', $spotsId)->get(['cameras_id','cameras_name','cameras_url']);
            $bicycles = Bicycle::where('spots_id', $spotsId)->whereIn('bicycles_status', ['None','違反'])->get();
            //cameraの項目
            $cameraNew=[];
            if (count($cameraAll) == 0) {
                for ($i=0; $i <= count($cameraAll); $i++) {
                    $cameraNew[$i]= [
                        'id' => [],
                        'name' => [],
                        'url' => [],
                    ];
                }
            } else {
                for ($i=0; $i < count($cameraAll); $i++){
                    $cameraNew[$i]= [
                        'id' => $cameraAll[$i]['cameras_id'],
                        'name' => $cameraAll[$i]['cameras_name'],
                        'url' => $cameraAll[$i]['cameras_url'],
                    ];
                }
            }
            //situationの項目
            $labelNames =[];
            for ($i=0; $i < count($bicycles); $i++) {
                if (!(in_array($bicycles[$i]['labels_name'], $labelNames))) {
                    array_push($labelNames,$bicycles[$i]['labels_name']); 
                }
            }
            $labelNamesNew = array_unique($labelNames);

            if (count($labelNamesNew) == 0) {
                for ($i=0; $i <= count($labelNamesNew); $i++) {
                    $situation[$i]= [
                        'row' => [],
                        'bicycle' => [],
                    ];
                }
            } else {
                for($i=0; $i < count($labelNamesNew); $i++) {
                    $bicycle = Bicycle::where('spots_id', $spotsId)->where('labels_name',$labelNamesNew[$i])->get(['cameras_id', 'get_id','bicycles_id','updated_at','created_at','bicycles_status']);

                    for ($k=0; $k < count($bicycle); $k++) {
                        if ($bicycle[$k]['bicycles_status'] == 'None'){
                            $bicycle[$k]['bicycles_status'] = false;
                        } elseif ($bicycle[$k]['bicycles_status'] == '違反'){
                            $bicycle[$k]['bicycles_status'] = true;
                        } else {
                            $bicycle[$k]['bicycles_status'] = false;
                        }
                        $time = strtotime($bicycle[$k]['updated_at']) - strtotime($bicycle[$k]['created_at']);
                        $bicycleNew[$k]= [
                            'id' => $bicycle[$k]['get_id'],
                            'cameras_id' => $bicycle[$k]['cameras_id'],
                            'time' => $time,
                            'violatin_status' => $bicycle[$k]['bicycles_status'],
                            'violatin_img' => "None",
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
}
