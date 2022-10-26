<?php

namespace App\Http\Controllers\Csv;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bicycle;

class CsvController extends Controller
{
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
}
