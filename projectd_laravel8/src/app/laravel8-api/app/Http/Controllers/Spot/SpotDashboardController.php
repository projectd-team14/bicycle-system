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
        $spots = Spot::where('users_id', $id)->get(['spots_id', 'spots_name', 'spots_violations', 'spots_max']);
        $dataAll = [];

        for ($i = 0; $i < count($spots); $i++) {
            //違法駐輪数推移
            $violationStr = explode(",",$spots[$i]["spots_violations"]);
            $violationInt = array_map('intval', $violationStr);

            // 混雑度
            $cameraCount = Camera::where('spots_id', $spots[$i]['spots_id'])->get('cameras_count');
            $count = 0;

            for ($i2 = 0; $i2 < count($cameraCount); $i2++) {
                $count = $count + $cameraCount[$i2]['cameras_count'];    
            }

            $data = [
                'spots_name' => $spots[$i]['spots_name'],
                'spots_violations' => $violationInt,
                'spots_congestion' => 100 * $count / $spots[$i]['spots_max']
            ];

            array_push($dataAll, $data);
        }

        return $dataAll;
    }   
}
