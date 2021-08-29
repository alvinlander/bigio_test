<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Models\Student;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class StudentController extends Controller
{
    public function loginPage()
    {
        return view('pages.student.login');
    }
    public function login(LoginRequest $request)
    {
        $user = $request->all();
        $checkUser = Student::where('email', $user['email'])->first();
        if ($checkUser && Hash::check($user['password'], $checkUser->password)) {
            // Auth::login($checkUser);
            dd($checkUser);
        }
        throw ValidationException::withMessages([
            'email' => "The credentials is not match"
        ]);
    }
}
