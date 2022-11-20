<?php

namespace App\Http\Controllers\Spot;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Spot;
use App\Models\Bicycle;

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
             'spots_over_time' => $data['spots_over_time'] * 3600,
             'spots_url' => $data['spots_url'],
        ]);            

        return $data;
    }

    public function deleteSpot(Request $request, $id)
    {
        $inputs = $request->all();
         Spot::where('spots_id', $id)->delete();
         Camera::where('spots_id', $id)->delete();

        return "削除完了";
    }

}
