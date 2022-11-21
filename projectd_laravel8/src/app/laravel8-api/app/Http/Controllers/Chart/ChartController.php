<?php

namespace App\Http\Controllers\Chart;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Spot;
use App\Models\Camera;

class ChartController extends Controller
{
    public function chart()
    {
        $spotCount = Spot::get(['spots_id', 'spots_count_day1', 'spots_count_week1', 'spots_count_month1', 'spots_count_month3']);
        $camera = Camera::get(['spots_id', 'cameras_count']);

        $spotCountDay1 = [];
        $spotCountWeek1 = [];
        $spotCountMonth1 = [];
        $spotCountMonth3 = [];

        for ($i=0; $i < count($spotCount); $i++) {
            // １時間
            $countDay1 = 0;
            $dataDay1 = '';
            $dataAveWeek1 = 'None';
            $dataAveMonth1 = 'None';
            $dataAveMonth3 = 'None';
            $listDay1 = explode(",",$spotCount[$i]['spots_count_day1']);
            $listWeek1 = explode(",",$spotCount[$i]['spots_count_week1']);
            $listMonth1 = explode(",",$spotCount[$i]['spots_count_month1']);
            $listMonth3 = explode(",",$spotCount[$i]['spots_count_month3']);
            
            for ($i2=0; $i2 < count($camera); $i2++) {
                if ($camera[$i2]['spots_id'] == $spotCount[$i]['spots_id']) {
                    $countDay1 = $countDay1 + $camera[$i2]['cameras_count'];
                }
            }
            array_push($spotCountDay1, [$spotCount[$i]['spots_id'], $countDay1]);

            if ($listDay1[0] === 'None') {
                $dataDay1 = (string)$countDay1;
            } else if (count($listDay1) >= 24) {
                $dataDay1 = (string)$countDay1;
                if ($spotCount[$i]['spots_count_week1'] == 'None'){
                    $dummyWeek1 = str_repeat('0,', 6);
                    $dataAveWeek1 = $dummyWeek1 . (string)(array_sum($listDay1) / 24);

                    $dummyMonth1 = str_repeat('0,', 29);
                    $dataAveMonth1 = $dummyMonth1 . (string)(array_sum($listDay1) / 24);

                    $dummyMonth3 = str_repeat('0,', 89);
                    $dataAveMonth3 = $dummyMonth3 . (string)(array_sum($listDay1) / 24);
                } else {
                    array_shift($listWeek1);
                    $beforeWeek1 = implode(',', $listWeek1);;
                    $dataAveWeek1 = $beforeWeek1 . ',' .(string)(array_sum($listDay1) / 24);

                    array_shift($listMonth1);
                    $beforeMonth1 = implode(',', $listMonth1);;
                    $dataAveMonth1 = $beforeMonth1 . ',' .(string)(array_sum($listDay1) / 24);

                    array_shift($listMonth3);
                    $beforeMonth3 = implode(',', $listMonth3);;
                    $dataAveMonth3 = $beforeMonth3 . ',' .(string)(array_sum($listDay1) / 24);
                }
            } else {
                $dataDay1 = $spotCount[$i]['spots_count_day1'] . ',' . (string)$countDay1;
            }

            // クエリ内容
            $insertData = [
                'spots_count_day1' => $dataDay1,
                'spots_count_week1' => $dataAveWeek1,
                'spots_count_month1' => $dataAveMonth1,
                'spots_count_month3' => $dataAveMonth3,
            ];

            // 最終時刻以外の時
            if ($dataAveWeek1 === 'None') {
                array_splice($insertData, 1);
            }

            Spot::where('spots_id', $spotCount[$i]['spots_id'])->update($insertData);
        }
        return $spotCountDay1;
    }
}
