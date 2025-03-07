<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/login', [App\Http\Controllers\AuthController::class, 'login']);
Route::post('/register', [App\Http\Controllers\AuthController::class, 'register']);

Route::middleware('auth:api')->group(function (): void {
    Route::post('/logout', [App\Http\Controllers\AuthController::class, 'logout']);

    Route::get('/user', fn(Request $request) => $request->user());

    Route::apiResource('projects', App\Http\Controllers\ProjectController::class);
});
