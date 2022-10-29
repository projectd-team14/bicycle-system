<?php

namespace App\Http\Controllers\Yolo;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Camera;


class YoloController extends Controller
{
    public function get_url($id)
    {
        $cameraUrl = Camera::where('cameras_id', $id)->get('cameras_url');
        
        return $cameraUrl;
    }

}
