<?php

namespace App\Http\Controllers\Label;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Label;

class LabelController extends Controller
{
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

    // ラベリングデータの初期設定用
    /* 
    public function labels_img($id)
    {
        $url = "host.docker.internal:9000/?label=1&id=${id}";
        $conn = curl_init();
        curl_setopt($conn, CURLOPT_URL, $url);
        curl_setopt($conn, CURLOPT_RETURNTRANSFER, true);
        $res =  curl_exec($conn);
        curl_close($conn);

        return  $res;
    }    
    */

}
