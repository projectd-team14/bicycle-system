<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use \Symfony\Component\HttpFoundation\Response;

class RegisterApiController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);

        // XSS対策（攻撃そのものの対策ではなく、HTMLタグをDBやレスポンスに含めないようにする）
        $data = $request->all();
        $htmlValidationData = $this->htmlValidation($data);

        if ($validator->fails() || $htmlValidationData) {
            return response()->json($validator->messages(), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $json = [
            'data' => $user,
            'message' => 'User registration success!',
            'error' => ''
        ];

        return response()->json( $json, Response::HTTP_OK);
    }

    private function htmlValidation($data)
    {
        $xssData = array_values($data);

        for ($i = 0; $i < count($xssData); $i++) {
            if (preg_match('/<.*>/', $xssData[$i])) {
                return true;
            }
        }

        return false;
    }
}