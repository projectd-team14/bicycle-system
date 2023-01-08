<?php

namespace App\Http\Controllers\Spot;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Spot;
use App\Models\Camera;

class SpotDashboardController extends Controller
{
    public function congestionsSpot($id)
    {
        $spots = Spot::where('users_id', $id)->get(['spots_id', 'spots_name', 'spots_count_day1', 'spots_violations', 'spots_max', 'spots_over_time']);
        $dataAll = [];
        $spotsId = [];

        if (count($spots) === 0) {
            $dataAll = [
                [
                    "spots_name" => "駐輪場がありません",
                    "spots_violations" => [],
                    "spots_count_day1" => [],
                    "spots_congestion" => 0
                ]
            ];

            return $dataAll;
        }

        for ($i = 0; $i < count($spots); $i++) {
            array_push($spotsId, $spots[$i]['spots_id']);
        }

        $cameraCount = Camera::where('spots_id', $spotsId)->get(['spots_id', 'cameras_count']);

        for ($i = 0; $i < count($spots); $i++) {
            //推移
            $violationStr = explode(",",$spots[$i]["spots_violations"]);
            $violationInt = array_map('intval', $violationStr);
            $day1Str = explode(",",$spots[$i]["spots_count_day1"]);
            $day1Int = array_map('intval', $day1Str);

            // 混雑度
            $count = 0;

            for ($j = 0; $j < count($cameraCount); $j++) {
                if ($cameraCount[$j]['spots_id'] === $spots[$i]['spots_id']){
                    $count = $count + $cameraCount[$j]['cameras_count'];                        
                }
            }

            $data = [
                'spots_name' => $spots[$i]['spots_name'],
                'spots_violations' => $violationInt,
                'spots_count_day1' => $day1Int,
                'spots_congestion' => 100 * $count / $spots[$i]['spots_max'],
                'spots_over_time' => $spots[$i]['spots_over_time']
            ];

            array_push($dataAll, $data);
        }

        return $dataAll;
    }   
}
