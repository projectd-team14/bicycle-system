<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\TestController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MainController;


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
//新しいAPI
Route::get('/get_spot/{id}', [HomeController::class, 'get_spot']);
Route::get('/get_all/{id}', [HomeController::class, 'get_all']);
Route::get('/open_api', [HomeController::class, 'open_api']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//認証
Route::post('/register', [RegisterController::class, 'register']);
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

//テスト用
Route::get('/test', [HomeController::class, 'test']);

//メイン処理
Route::get('/violation/{id}', [HomeController::class, 'violation']);
Route::get('/bicycle/{id}', [HomeController::class, 'bicycle']);
Route::get('/edit_spot/{id}', [HomeController::class, 'edit_spot']);
Route::get('/edit_camera/{id}', [HomeController::class, 'edit_camera']);

Route::post('/store_spot/{id}', [HomeController::class, 'store_spot']);
Route::post('/store_camera/{id}', [HomeController::class, 'store_camera']);

Route::post('/delete_spot/{id}', [HomeController::class, 'delete_spot']);
Route::post('/delete_camera/{id}', [HomeController::class, 'delete_camera']);

Route::post('/start/{id}', [HomeController::class, 'start']);
Route::post('/stop/{id}', [HomeController::class, 'stop']);
Route::post('/labels/{id}', [HomeController::class, 'labels']);

//ログインしたユーザーのみが/hogeにアクセスできる
Route::middleware('auth:sanctum')->group(function(){
    Route::get('/hoge', function(){
        return 'auth is working';
    });
});