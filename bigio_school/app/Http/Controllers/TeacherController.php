<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Models\Teacher;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class TeacherController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest');
    }
    public function loginPage()
    {
        return view('pages.teacher.login');
    }
    public function login(LoginRequest $request)
    {
        $user = $request->only('email', 'password');
        $checkUser = Teacher::where('email', $user['email'])->first();
        if ($checkUser && Hash::check($user['password'], $checkUser->password)) {
            // Auth::login($checkUser);
            dd($checkUser);
        }
        throw ValidationException::withMessages([
            'email' => "The credentials is not match"
        ]);
    }
}
