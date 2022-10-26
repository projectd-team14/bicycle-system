<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Camera\CameraController;
use App\Http\Controllers\Spot\SpotController;
use App\Http\Controllers\Label\LabelController;
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
Route::post('/register', [RegisterController::class, 'register']);
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// カメラ
Route::get('/edit_camera/{id}', [CameraController::class, 'edit_camera']);
Route::post('/store_camera/{id}', [CameraController::class, 'store_camera']);
Route::post('/delete_camera/{id}', [CameraController::class, 'delete_camera']);
Route::post('/start/{id}', [CameraController::class, 'start']);
Route::post('/stop/{id}', [CameraController::class, 'stop']);

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
Route::get('/get_spot/{id}', [HomeController::class, 'get_spot']);
Route::get('/get_all/{id}', [HomeController::class, 'get_all']);
Route::get('/open_api', [HomeController::class, 'open_api']);