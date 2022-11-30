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

        if ($labelSearchRecord == true) {
            $labelData = Label::where('cameras_id', $id)->update([
                'cameras_id' => $id,
                'labels_json' => $dataStr,
            ]);
    
            return  "ラベリングデータを更新しました";
        } else {
            $labelData = Label::insertGetId([
                'cameras_id' => $id,
                'labels_json' => $dataStr,
            ]);
    
            return  $labelSearchRecord;
        }
    }

    public function checkLabels($id)
    {
        $checkLabels = Label::where('cameras_id', $id)->exists(); 

        if ($checkLabels) {
            $checkLabels = Label::where('cameras_id', $id)->get('labels_json');
            
            return $checkLabels;
        } else {
            $labelsNull = [
                'labels_json' => 'ラベルが登録されていません。' 
            ];
            return $labelsNull;
        }
    }
}
