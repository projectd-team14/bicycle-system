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

        if (count($spots) === 0) {
            $dataAll = [
                [
                    "spots_name" => "駐輪場がありません",
                    "spots_violations" => [],
                    "spots_day1" => [],
                    "spots_congestion" => 0
                ]
            ];

            return $dataAll;
        }

        for ($i = 0; $i < count($spots); $i++) {
            //推移
            $violationStr = explode(",",$spots[$i]["spots_violations"]);
            $violationInt = array_map('intval', $violationStr);
            $day1Str = explode(",",$spots[$i]["spots_count_day1"]);
            $day1Int = array_map('intval', $day1Str);

            // 混雑度
            $cameraCount = Camera::where('spots_id', $spots[$i]['spots_id'])->get('cameras_count');
            $count = 0;

            for ($i2 = 0; $i2 < count($cameraCount); $i2++) {
                $count = $count + $cameraCount[$i2]['cameras_count'];    
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
