<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Providers\RouteServiceProvider; // 追加する
use App\Models\User; // 追加する
use Illuminate\Http\RedirectResponse; // 追加する
use Illuminate\Support\Facades\Hash; // 追加する
use Illuminate\Support\Facades\Validator; // 追加する
use \Symfony\Component\HttpFoundation\Response; // 追加する

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        //入力バリデーション
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);

        //バリデーションで問題があった際にはエラーを返す
        if ($validator->fails()) {
            return response()->json($validator->messages(), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        //バリエーションで問題がなかった場合にはユーザを作成する
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        //ユーザの作成が完了するとjsonを返す
        $json = [
            'data' => $user,
            'message' => 'User registration success!',
            'error' => ''
        ];
        return response()->json( $json, Response::HTTP_OK);
    }
}