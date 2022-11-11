<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterApiController;
use App\Http\Controllers\Auth\LoginApiController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MainController;
use App\Http\Controllers\Camera\CameraController;
use App\Http\Controllers\Spot\SpotController;
use App\Http\Controllers\Label\LabelController;
use App\Http\Controllers\Yolo\YoloController;
use App\Http\Controllers\Chart\ChartController;
use App\Http\Controllers\Csv\CsvController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// ログインしたユーザーのみアクセスできる
Route::middleware('auth:sanctum')->group(function(){
    Route::get('/hoge', function(){
        return 'auth is working';
    });
});

// 認証
Route::get('/reset', [HomeController::class, 'reset']);
Route::post('/register', [RegisterApiController::class, 'register']);
Route::post('/login', [LoginApiController::class, 'login']);
Route::post('/logout', [LoginApiController::class, 'logout']);

// カメラ
Route::get('/edit_camera/{id}', [CameraController::class, 'edit_camera']);
Route::post('/store_camera/{id}', [CameraController::class, 'store_camera']);
Route::post('/delete_camera/{id}', [CameraController::class, 'delete_camera']);
Route::get('/start/{id}', [CameraController::class, 'start']);
Route::get('/stop/{id}', [CameraController::class, 'stop']);

// 駐輪場
Route::get('/edit_spot/{id}', [SpotController::class, 'edit_spot']);
Route::post('/store_spot/{id}', [SpotController::class, 'store_spot']);
Route::post('/delete_spot/{id}', [SpotController::class, 'delete_spot']);

// ラベリングデータ
Route::post('/labels/{id}', [LabelController::class, 'labels']);
Route::get('/labels_img/{id}', [LabelController::class, 'labels_img']);

// CSV
Route::get('/csv/{id}', [CsvController::class, 'csv']);

// その他
Route::get('/get_spot/{id}', [MainController::class, 'get_spot']);
Route::get('/get_all/{id}', [MainController::class, 'get_all']);
Route::get('/open_api', [MainController::class, 'open_api']);

// YOLOv5
Route::get('/get_camera_all', [YoloController::class, 'get_camera_all']);
Route::get('/get_camera_status/{id}', [YoloController::class, 'get_camera_status']);
Route::get('/get_camera_stop/{id}', [YoloController::class, 'get_camera_stop']);
Route::get('/get_camera_count/{id}/{count}', [YoloController::class, 'get_camera_count']);

Route::get('/get_url/{id}', [YoloController::class, 'get_url']);
Route::get('/over_time/{id}', [YoloController::class, 'over_time']);
Route::get('/get_label/{id}', [YoloController::class, 'get_label']);
Route::get('/get_id/{id}', [YoloController::class, 'get_id']);

Route::get('/bicycle_status/{camera_id}/{get_id}', [YoloController::class, 'bicycle_status']);
Route::post('/bicycle_update', [YoloController::class, 'bicycle_update']);
Route::post('/bicycle_delete/{camera_id}', [YoloController::class, 'bicycle_delete']);
Route::post('/bicycle_violation', [YoloController::class, 'bicycle_violation']);

Route::get('/get_spot_day1/{id}', [YoloController::class, 'get_spot_day1']);
Route::post('/get_spot_day1_update/{id}/', [YoloController::class, 'get_spot_day1_update']);

Route::get('/get_spot_week1/{id}', [YoloController::class, 'get_spot_week1']);
Route::post('/get_spot_week1_update/{id}/', [YoloController::class, 'get_spot_week1_update']);

Route::get('/get_spot_month1/{id}', [YoloController::class, 'get_spot_month1']);
Route::post('/get_spot_month1_update/{id}/', [YoloController::class, 'get_spot_month1_update']);

Route::get('/get_spot_month3/{id}', [YoloController::class, 'get_spot_month3']);
Route::post('/get_spot_month3_update/{id}/', [YoloController::class, 'get_spot_month3_update']);
Route::get('/server_condition/{id}', [YoloController::class, 'server_condition']);

// AWS Lambda
Route::get('/chart', [ChartController::class, 'chart']);