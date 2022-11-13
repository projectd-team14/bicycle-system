<?php

namespace App\Http\Controllers\Yolo;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Camera;
use App\Models\Spot;
use App\Models\Label;
use App\Models\Bicycle;

class YoloController extends Controller
{
    public function getCameraAll()
    {
        $cameraAll = Camera::get(['spots_id', 'cameras_count']);

        return $cameraAll;
    }

    public function getCameraStatus($id)
    {
        $cameraStatus = Camera::where('cameras_id', $id)->get('cameras_status');
        
        return $cameraStatus;
    }

    public function getCameraStop($id)
    {
        Bicycle::where('cameras_id', $id)->delete();
        
        return "終了";
    }

    public function getCameraCount($id, $count)
    {
        Camera::where('cameras_id', $id)->update(['cameras_count' => $count]);
        
        return $count;
    }

    public function getUrl($id)
    {
        $cameraUrl = Camera::where('cameras_id', $id)->get('cameras_url');
        
        return $cameraUrl;
    }

    public function overTime($id)
    {
        $spotId = Camera::where('cameras_id', $id)->get('spots_id');
        $overTime = Spot::where('spots_id', $spotId[0]["spots_id"])->get(['spots_id', 'spots_over_time']);

        return $overTime;
    }

    public function getLabel($id)
    {
        $labelJson = Label::where('cameras_id', $id)->get('labels_json');

        return $labelJson;
    }

    public function getId($id)
    {
        $labelJson = Bicycle::where('cameras_id', $id)->get('get_id');
        $idList = [];
        for ($i=0; $i<count($labelJson); $i++) {
            array_push($idList,$labelJson[$i]['get_id']); 
        }

        return $idList;
    }

    public function bicycleStatus($camera_id, $get_id)
    {
        $bicycleStatus = Bicycle::where('cameras_id', $camera_id)->where('get_id', $get_id)->get(['bicycles_id', 'bicycles_status', 'updated_at', 'created_at']);
        $bicycleList = [$bicycleStatus[0]['bicycles_id'], $bicycleStatus[0]['bicycles_status'], $bicycleStatus[0]['updated_at'], $bicycleStatus[0]['created_at']];

        return $bicycleList;
    }

    public function bicycleUpdate(Request $request)
    {
        $inputs = $request->all();
        $bicycleStatusList = [];
        for ($i=0; $i<count($inputs); $i++) {
            if ($inputs[$i]['type'] === 'insert') {
                $bicycleInsert = Bicycle::insertGetId([
                    'spots_id' => $inputs[$i]['spots_id'],
                    'cameras_id' => $inputs[$i]['cameras_id'],
                    'labels_name' => $inputs[$i]['labels_name'], 
                    'get_id' => $inputs[$i]['get_id'],
                    'bicycles_x_coordinate' => $inputs[$i]['bicycles_x_coordinate'],
                    'bicycles_y_coordinate' => $inputs[$i]['bicycles_y_coordinate'],
                    'bicycles_status' => 'None',
               ]);
            } else {
                $bicycleUpdate = Bicycle::where('cameras_id', $inputs[$i]['cameras_id'])->where('get_id', $inputs[$i]['get_id'])->update([
                    'bicycles_x_coordinate' => $inputs[$i]['bicycles_x_coordinate'],
                    'bicycles_y_coordinate' => $inputs[$i]['bicycles_y_coordinate'],
               ]);
            }
            $bicycleStatus = Bicycle::where('cameras_id', $inputs[$i]['cameras_id'])->where('get_id', $inputs[$i]['get_id'])->get(['bicycles_id', 'bicycles_status', 'updated_at', 'created_at']);
            $bicycleGet = [
                'get_id' => $inputs[$i]['get_id'],
                'bicycles_id' => $bicycleStatus[0]['bicycles_id'],
                'bicycles_status' => $bicycleStatus[0]['bicycles_status'],
                'updated_at' => $bicycleStatus[0]['updated_at'],
                'created_at' => $bicycleStatus[0]['created_at']
            ];
            array_push($bicycleStatusList, $bicycleGet);
        }

       return $bicycleStatusList;
    }

    public function bicycleDelete(Request $request, $camera_id)
    {
        $inputs = $request->all();
        for ($i=0; $i<count($inputs['delete_list']); $i++){
            Bicycle::where('cameras_id', $camera_id)->where('get_id', $inputs['delete_list'][$i])->delete();
        }
        
        return $inputs;
    }

    public function bicycleViolation(Request $request)
    {
        $inputs = $request->all();
        for ($i=0; $i<count($inputs['violation_list']); $i++) {
            $bicycleViolation = Bicycle::where('cameras_id', $inputs['camera_id'])->where('get_id', $inputs['violation_list'][$i])->update(['bicycles_status' => '違反']);
        }
        
        return $inputs;
    }


    public function getSpotDay1($id)
    {
        $spotDay1 = Spot::where('spots_id', $id)->get('spots_count_day1');

        return $spotDay1;
    }

    public function getSpotDay1Update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotDay1Update = Spot::where('spots_id', $id)->update(['spots_count_day1' => $inputs['spots_count_day1']]);

        return $spotDay1Update;
    }

    public function getSpotWeek1($id)
    {
        $spotWeek1 = Spot::where('spots_id', $id)->get('spots_count_week1');

        return $spotWeek1;
    }

    public function getSpotWeek1Update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotWeek1Update = Spot::where('spots_id', $id)->update(['spots_count_week1' => $inputs['spots_count_week1']]);

        return $spotWeek1Update;
    }

    public function getSpotMonth1($id)
    {
        $spotMonth1 = Spot::where('spots_id', $id)->get('spots_count_month1');

        return $spotMonth1;
    }

    public function getSpotMonth1Update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotMonth1Update = Spot::where('spots_id', $id)->update(['spots_count_month1' => $inputs['spots_count_month1']]);

        return $spotMonth1Update;
    }

    public function getSpotMonth3($id)
    {
        $spotMonth1 = Spot::where('spots_id', $id)->get('spots_count_month3');

        return $spotMonth1;
    }

    public function getSpotMonth3Update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotMonth3Update = Spot::where('spots_id', $id)->update(['spots_count_month3' => $inputs['spots_count_month3']]);

        return $spotMonth3Update;
    }

    public function serverCondition($id)
    {
        $serverCondition = Bicycle::where('cameras_id', $id)->exists();

        if ($serverCondition) {
            return ['condition' =>'true'];
        } else {
            return ['condition' =>'false'];
        }
    }

    public function serverUpdate(Request $request, $id)
    {
        $inputs = $request->all();
        $bicycleOld = Bicycle::where('cameras_id', $id)->get('get_id');

        $newIdList = [];
        $oldIdList = [];

        for ($i=0; $i<count($inputs); $i++) {
            $bicycleServerUpdate = Bicycle::where('cameras_id', $id)->where('get_id', $inputs[$i]['old'])->update(['get_id' => $inputs[$i]['new']]);
        }

        for ($i=0; $i<count($inputs); $i++) {
            array_push($newIdList, $inputs[$i]['old']);
        }

        for ($i=0; $i<count($bicycleOld); $i++) {
            array_push($oldIdList, $bicycleOld[$i]['get_id']);
        }

        for ($i=0; $i<count($bicycleOld); $i++) {
            if (!in_array($bicycleOld[$i]['get_id'], $newIdList)) {
                $bicycleDelete = Bicycle::where('cameras_id', $id)->where('get_id', $bicycleOld[$i]['get_id'])->delete();
            }
        }

        return $inputs;
    }
}
