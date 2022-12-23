<?php

namespace App\Http\Controllers\Chart;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Jobs\CreateChartJob;

class ChartController extends Controller
{
    public function chart()
    {
        CreateChartJob::dispatch();
    }
}
