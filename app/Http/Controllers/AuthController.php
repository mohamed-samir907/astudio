<?php

namespace App\Http\Controllers;

use Throwable;
use App\Models\User;
use App\Support\ApiResponse;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use Illuminate\Support\Facades\Hash;

class AuthController
{
    public function __construct(
        private ApiResponse $apiResponse,
    ) {}

    public function login(LoginRequest $request): JsonResponse
    {
        try {
            if (! Auth::attempt($request->validated())) {
                return $this->apiResponse->unauthenticated('Invalid credentials');
            }

            /** @var User $user */
            $user = Auth::user();
            $token = $user->createToken('auth_token');

            return $this->apiResponse->success([
                'access_token' => $token->accessToken,
            ]);
        } catch (Throwable $e) {
            return $this->apiResponse->error($e->getMessage());
        }
    }

    public function register(RegisterRequest $request): JsonResponse
    {
        try {
            $user = User::query()->create([
                'first_name' => $request->input('first_name'),
                'last_name' => $request->input('last_name'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password')),
            ]);

            $token = $user->createToken('auth_token');

            return $this->apiResponse->success([
                'access_token' => $token->accessToken,
            ]);
        } catch (Throwable $e) {
            return $this->apiResponse->error($e->getMessage());
        }
    }

    public function logout(): JsonResponse
    {
        request()->user()->tokens()->delete();

        return $this->apiResponse->success(message: 'Logged out successfully');
    }
}
