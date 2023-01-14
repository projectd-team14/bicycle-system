<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\User;
use App\Models\Log;

class CreateUserJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $param;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($request)
    {
        $this->param = $request->email;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $searchUserId = User::whereEmail($this->param)->get(['id']);
        Log::insertGetId([
            'logs_id' => $searchUserId[0]['id'],
            'logs_status' => 'user',
            'logs_message' => 'create_new_user'
        ]);
    }
}