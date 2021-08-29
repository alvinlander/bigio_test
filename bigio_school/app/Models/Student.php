<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Student extends Model
{
    use HasFactory;
    public function Course()
    {
        return $this->hasMany(Course::class);
    }

    public function Teacher()
    {
        return $this->belongsTo(Teacher::class);
    }

    public function scopeGetByTeacher($query)
    {
        $checkTeacher = Teacher::where('email', Auth::user('email'));
        return $query->where('teacher_id', $checkTeacher['id']);
    }
}
