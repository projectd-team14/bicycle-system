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
    public function get_camera_all()
    {
        $cameraAll = Camera::get(['spots_id', 'cameras_count']);

        return $cameraAll;
    }

    public function get_camera_status($id)
    {
        $cameraStatus = Camera::where('cameras_id', $id)->get('cameras_status');
        
        return $cameraStatus;
    }

    public function get_camera_stop($id)
    {
        Bicycle::where('cameras_id', $id)->delete();
        
        return "終了";
    }

    public function get_camera_count($id, $count)
    {
        Camera::where('cameras_id', $id)->update(['cameras_count' => $count]);
        
        return $count;
    }

    public function get_url($id)
    {
        $cameraUrl = Camera::where('cameras_id', $id)->get('cameras_url');
        
        return $cameraUrl;
    }

    public function over_time($id)
    {
        $spotId = Camera::where('cameras_id', $id)->get('spots_id');
        $overTime = Spot::where('spots_id', $spotId[0]["spots_id"])->get(['spots_id', 'spots_over_time']);

        return $overTime;
    }

    public function get_label($id)
    {
        $labelJson = Label::where('cameras_id', $id)->get('labels_json');

        return $labelJson;
    }

    public function get_id($id)
    {
        $labelJson = Bicycle::where('cameras_id', $id)->get('get_id');
        $idList = [];
        for ($i=0; $i<count($labelJson); $i++) {
            array_push($idList,$labelJson[$i]['get_id']); 
        }

        return $idList;
    }

    public function bicycle_status($camera_id, $get_id)
    {
        $bicycleStatus = Bicycle::where('cameras_id', $camera_id)->where('get_id', $get_id)->get(['bicycles_id', 'bicycles_status', 'updated_at', 'created_at']);
        $bicycleList = [$bicycleStatus[0]['bicycles_id'], $bicycleStatus[0]['bicycles_status'], $bicycleStatus[0]['updated_at'], $bicycleStatus[0]['created_at']];

        return $bicycleList;
    }

    public function bicycle_update(Request $request)
    {
        $inputs = $request->all();
        $bicycleStatusList = [];
        for ($i=0; $i<count($inputs); $i++) {
            if ($inputs[$i]['type'] == 'insert') {
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

    public function bicycle_delete(Request $request, $camera_id)
    {
        $inputs = $request->all();
        for ($i=0; $i<count($inputs['delete_list']); $i++){
            Bicycle::where('cameras_id', $camera_id)->where('get_id', $inputs['delete_list'][$i])->delete();
        }
        
        return $inputs;
    }

    public function bicycle_violation(Request $request)
    {
        $inputs = $request->all();
        for ($i=0; $i<count($inputs['violation_list']); $i++) {
            $bicycleViolation = Bicycle::where('cameras_id', $inputs['camera_id'])->where('get_id', $inputs['violation_list'][$i])->update(['bicycles_status' => '違反']);
        }
        
        return $inputs;
    }


    public function get_spot_day1($id)
    {
        $spotDay1 = Spot::where('spots_id', $id)->get('spots_count_day1');

        return $spotDay1;
    }

    public function get_spot_day1_update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotDay1Update = Spot::where('spots_id', $id)->update(['spots_count_day1' => $inputs['spots_count_day1']]);

        return $spotDay1Update;
    }

    public function get_spot_week1($id)
    {
        $spotWeek1 = Spot::where('spots_id', $id)->get('spots_count_week1');

        return $spotWeek1;
    }

    public function get_spot_week1_update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotWeek1Update = Spot::where('spots_id', $id)->update(['spots_count_week1' => $inputs['spots_count_week1']]);

        return $spotWeek1Update;
    }

    public function get_spot_month1($id)
    {
        $spotMonth1 = Spot::where('spots_id', $id)->get('spots_count_month1');

        return $spotMonth1;
    }

    public function get_spot_month1_update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotMonth1Update = Spot::where('spots_id', $id)->update(['spots_count_month1' => $inputs['spots_count_month1']]);

        return $spotMonth1Update;
    }

    public function get_spot_month3($id)
    {
        $spotMonth1 = Spot::where('spots_id', $id)->get('spots_count_month3');

        return $spotMonth1;
    }

    public function get_spot_month3_update(Request $request, $id)
    {
        $inputs = $request->all();
        $spotMonth3Update = Spot::where('spots_id', $id)->update(['spots_count_month3' => $inputs['spots_count_month3']]);

        return $spotMonth3Update;
    }
}
