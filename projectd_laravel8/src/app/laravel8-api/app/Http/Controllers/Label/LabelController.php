<?php

namespace App\Http\Controllers\Label;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Label;

class LabelController extends Controller
{
    public function labels(Request $request, $id)
    {
        $labelSearchRecord = Label::where('cameras_id', $id)->exists();
        $data = $request->all();
        $dataStr = json_encode($data);
        $ipAddress = env('LARAVEL_URL');
        
        if ($labelSearchRecord == true) {
            $params = [
                "labels_json" => $dataStr
            ];
            $json_params = json_encode($params);

            $headers = [
              'Content-Type: application/json',
              'Accept-Charset: UTF-8',
            ];

            $labelData = Label::where('cameras_id', $id)->update(['cameras_id' => $id, 'labels_json' => $dataStr]);
    
            /*
            $url = "${ipAddress}/create_labels_image/?id=${id}";
            $conn = curl_init();
            curl_setopt($conn, CURLOPT_URL, $url);
            curl_setopt($conn,CURLOPT_POST, TRUE);
            curl_setopt($conn, CURLOPT_POSTFIELDS, $json_params);
            curl_setopt($conn, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
            $res =  curl_exec($conn);
            curl_close($conn);            
            */
            
            return  "ラベルを更新しました。";
        } else {
            $labelData = Label::insertGetId([
                'cameras_id' => $id,
                'labels_json' => $dataStr,
            ]);
    
            return  "ラベルを更新しました。";
        }
    }

    public function checkLabels($id)
    {
        $checkLabels = Label::where('cameras_id', $id)->exists(); 

        if ($checkLabels) {
            $checkLabels = Label::where('cameras_id', $id)->get('labels_json');

            $result = json_decode($checkLabels[0]['labels_json']);
            
            return $result;
        } else {
            return 'ラベルが登録されていません。' ;
        }
    }
}
