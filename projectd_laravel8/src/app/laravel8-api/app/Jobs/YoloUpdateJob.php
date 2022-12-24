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
        $bicycleStatusList = [];

        for ($i=0; $i < count($inputs); $i++) {
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
}
