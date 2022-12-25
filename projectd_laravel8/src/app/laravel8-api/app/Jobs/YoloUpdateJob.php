<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Bicycle;

class YoloUpdateJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $param;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($inputs)
    {
        $this->param = $inputs;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //
    }

    public function getResult()
    {
        $inputs = $this->param;
        $insertItem = [];
        $updateItem = []; 
        $updateCameraId = [];
        $updateGetId = [];
        $cameraIdItem = [];        
        $getIdItem = [];

        for ($i = 0; $i < count($inputs); $i++) {
            if ($inputs[$i]['type'] === 'insert') {
                $data = [
                    'spots_id' => $inputs[$i]['spots_id'],
                    'cameras_id' => $inputs[$i]['cameras_id'],
                    'labels_name' => $inputs[$i]['labels_name'], 
                    'get_id' => $inputs[$i]['get_id'],
                    'bicycles_x_coordinate' => $inputs[$i]['bicycles_x_coordinate'],
                    'bicycles_y_coordinate' => $inputs[$i]['bicycles_y_coordinate'],
                    'bicycles_status' => 'None'
                ];

                array_push($insertItem, $data);
            } else {
                $data = [
                    'bicycles_x_coordinate' => $inputs[$i]['bicycles_x_coordinate'],
                    'bicycles_y_coordinate' => $inputs[$i]['bicycles_y_coordinate']
                ];
                
                array_push($updateItem, $data);
                array_push($updateCameraId, $inputs[$i]['cameras_id']);
                array_push($updateGetId, $inputs[$i]['get_id']);
            }

            array_push($cameraIdItem, $inputs[$i]['cameras_id']);
            array_push($getIdItem, $inputs[$i]['get_id']);
        }

        Bicycle::insert($insertItem);
        Bicycle::where('cameras_id', $updateCameraId)->where('get_id', $updateGetId)->update($updateItem);
        $bicycleStatus = Bicycle::where('cameras_id', $cameraIdItem)->where('get_id', $getIdItem)->get(['bicycles_id', 'get_id', 'bicycles_status', 'updated_at', 'created_at']);

       return $bicycleStatus;
    }
}
