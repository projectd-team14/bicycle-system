<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Bicycle;

class YoloDeleteJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $param;
    protected $camera_id;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($inputs, $camera_id)
    {
        $this->input = $inputs;
        $this->camera_id = $camera_id;
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

        for ($i = 0; $i < count($inputs['delete_list']); $i++){
            array_push($cameraIdItem, $this->camera_id);
            array_push($getIdItem, $inputs['delete_list'][$i]);
        }

        Bicycle::where('cameras_id', $cameraIdItem)->where('get_id', $getIdItem)->delete();

        return $inputs;
    }
}
