<?php

namespace App\Http\Controllers\Spot;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Spot;
use App\Models\Bicycle;
use App\Jobs\CreateSpotJob;
use App\Jobs\DeleteSpotJob;

class SpotController extends Controller
{
    public function editSpot($id){
        $cameras = Spot::where('users_id', $id)->get();

        return $cameras;
    }

    public function storeSpot(Request $request, $id)
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

        $spotStatus = 0;

        if ($data['spots_status'] === '自転車') {
            $spotStatus = 1;
        } else if ($data['spots_status'] === 'バイク') {
            $spotStatus = 2;
        } else if ($data['spots_status'] === '全てを管理') {
            $spotStatus = 3;
        }

        // XSS対策（攻撃そのものの対策ではなく、HTMLタグをDBやレスポンスに含めないようにする）
        if ($this->htmlValidation($data)) {
            return '使用できない文字が含まれています';
        }

        $spotId = Spot::insertGetId([
             'spots_name' => $data['spots_name'],
             'users_id' => $id, 
             'spots_longitude' => $insertLong, 
             'spots_latitude' => $insertLat,
             'spots_address' => $data['spots_address'],
             'spots_status' => $spotStatus,
             'spots_count_day1' => 'None',
             'spots_count_week1' => 'None',
             'spots_count_month1' => 'None',
             'spots_count_month3' => 'None',
             'spots_violations' => 'None',
             'spots_over_time' => $data['spots_over_time'] * 3600,
             'spots_max' => $data['spots_max'],
             'spots_url' => $data['spots_url'],
        ]);      

        $this->createSpotLog($data);

        return $data;
    }

    public function deleteSpot(Request $request, $id)
    {
        $deleteSpotName = Spot::where('spots_id', $id)->get(['spots_name']);
        $this->deleteSpotLog($deleteSpotName);
        Spot::where('spots_id', $id)->delete();
        Camera::where('spots_id', $id)->delete();

        return "削除完了";
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

    private function createSpotLog($data)
    {
        CreateSpotJob::dispatch($data);
    }

    private function deleteSpotLog($deleteSpotName)
    {
        DeleteSpotJob::dispatch($deleteSpotName);
    } 
}
