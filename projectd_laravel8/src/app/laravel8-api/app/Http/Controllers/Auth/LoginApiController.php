<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use App\Models\User;
use \Symfony\Component\HttpFoundation\Response;

class LoginApiController extends Controller
{
    public function login(Request $request){
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        // ログイン処理
        if(Auth::attempt($credentials)){
            $user = User::whereEmail($request->email)->first();

            $user->tokens()->delete();
            $token = $user->createToken("login:user{$user->id}")->plainTextToken;
            return response()->json(['token' => $token, 'user' => $user], Response::HTTP_OK);
        }
        // ログイン失敗時の処理
        return response()->json('Can Not Login.', Response::HTTP_INTERNAL_SERVER_ERROR);
    }

    public function logout(Request $request){
        auth('sanctum')->user()->tokens()->delete();
        return response(['message' => 'You have been successfully logged out.'], 200);
    }

    public function user(Request $request){
        $user = $request->user();
        return response()->json(compact('user'), 200);
    }
}