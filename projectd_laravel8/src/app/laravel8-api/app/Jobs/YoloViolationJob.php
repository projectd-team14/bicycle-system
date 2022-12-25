<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Bicycle;

class YoloViolationJob implements ShouldQueue
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
        $this->input = $inputs;
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
        $inputs = $this->input;
        $cameraIdItem = [];        
        $getIdItem = [];

        for ($i = 0; $i < count($inputs['violation_list']); $i++) {
            array_push($cameraIdItem, $inputs['camera_id']);
            array_push($getIdItem, $inputs['violation_list'][$i]);
        }

        Bicycle::whereIn('cameras_id', $cameraIdItem)->whereIn('get_id', $getIdItem)->update(['bicycles_status' => '違反']);

        return $inputs;
    }
}
