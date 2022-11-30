<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterApiController;
use App\Http\Controllers\Auth\LoginApiController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MainController;
use App\Http\Controllers\Camera\CameraController;
use App\Http\Controllers\Spot\SpotController;
use App\Http\Controllers\Spot\SpotDashboardController;
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

// ダッシュボード
Route::get('/congestions_spot/{id}', [SpotDashboardController::class, 'CongestionsSpot']);

// カメラ
Route::get('/edit_camera/{id}', [CameraController::class, 'editCamera']);
Route::post('/store_camera/{id}', [CameraController::class, 'storeCamera']);
Route::post('/delete_camera/{id}', [CameraController::class, 'deleteCamera']);
Route::get('/start/{id}', [CameraController::class, 'start']);
Route::get('/stop/{id}', [CameraController::class, 'stop']);

// 駐輪場
Route::get('/edit_spot/{id}', [SpotController::class, 'editSpot']);
Route::post('/store_spot/{id}', [SpotController::class, 'storeSpot']);
Route::post('/delete_spot/{id}', [SpotController::class, 'deleteSpot']);

// ラベリングデータ
Route::post('/labels/{id}', [LabelController::class, 'labels']);
Route::get('/labels_img/{id}', [LabelController::class, 'labelsImg']);
Route::get('/check_labels/{id}', [LabelController::class, 'checkLabels']);

// CSV
Route::get('/csv/{id}', [CsvController::class, 'csv']);

// その他
Route::get('/get_spot/{id}', [MainController::class, 'getSpot']);
Route::get('/get_all/{id}', [MainController::class, 'getAll']);
Route::get('/open_api', [MainController::class, 'openApi']);

// YOLOv5
Route::get('/get_camera_all', [YoloController::class, 'getCameraAll']);
Route::get('/get_camera_status/{id}', [YoloController::class, 'getCameraStatus']);
Route::get('/get_camera_stop/{id}', [YoloController::class, 'getCameraStop']);
Route::get('/get_camera_count/{id}/{count}', [YoloController::class, 'getCameraCount']);

Route::get('/get_url/{id}', [YoloController::class, 'getUrl']);
Route::get('/over_time/{id}', [YoloController::class, 'overTime']);
Route::get('/get_label/{id}', [YoloController::class, 'getLabel']);
Route::get('/get_id/{id}', [YoloController::class, 'getId']);

Route::get('/bicycle_status/{camera_id}/{get_id}', [YoloController::class, 'bicycleStatus']);
Route::post('/bicycle_update', [YoloController::class, 'bicycleUpdate']);
Route::post('/bicycle_delete/{camera_id}', [YoloController::class, 'bicycleDelete']);
Route::post('/bicycle_violation', [YoloController::class, 'bicycleViolation']);

Route::get('/get_spot_day1/{id}', [YoloController::class, 'getSpotDay1']);
Route::post('/get_spot_day1_update/{id}/', [YoloController::class, 'getSpotDay1Update']);

Route::get('/get_spot_week1/{id}', [YoloController::class, 'getSpotWeek1']);
Route::post('/get_spot_week1_update/{id}/', [YoloController::class, 'getSpotWeek1Update']);

Route::get('/get_spot_month1/{id}', [YoloController::class, 'getSpotMonth1']);
Route::post('/get_spot_month1_update/{id}/', [YoloController::class, 'getSpotMonth1Update']);

Route::get('/get_spot_month3/{id}', [YoloController::class, 'getSpotMonth3']);
Route::post('/get_spot_month3_update/{id}/', [YoloController::class, 'getSpotMonth3Update']);

Route::get('/server_condition/{id}', [YoloController::class, 'serverCondition']);
Route::post('/server_update/{id}', [YoloController::class, 'serverUpdate']);

// AWS Lambda
Route::get('/chart', [ChartController::class, 'chart']);