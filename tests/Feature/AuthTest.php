<?php

use App\Models\User;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Config;
use Database\Seeders\PassportPersonalClientSeeder;

use function Pest\Laravel\postJson;

beforeEach(function (): void {
    $this->seed(PassportPersonalClientSeeder::class);

    $this->user = User::factory()->create([
        'email' => 'mohamed@user.com',
        'password' => Hash::make('password'),
    ]);
});

describe('Login', function (): void {
    it('should return an error if the credentials are invalid', function (): void {
        $response = postJson('/api/login', [
            'email' => $this->user->email,
            'password' => 'wrong-password',
        ]);

        $response->assertStatus(401)
            ->assertJson([
                'success' => false,
                'message' => 'Unauthenticated',
            ]);
    });

    it('should return a token if the credentials are valid', function (): void {
        $response = postJson('/api/login', [
            'email' => $this->user->email,
            'password' => 'password',
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'access_token',
                ],
            ]);
    });

    it('should return an error if unexpected issue happened', function (): void {
        Config::set('passport.personal_access_client.secret', 'invalid-secret');

        $response = postJson('/api/login', [
            'email' => $this->user->email,
            'password' => 'password',
        ]);

        $response->assertStatus(400)
            ->assertJson([
                'success' => false,
                'message' => 'Client authentication failed',
            ]);
    });
});

describe('Register', function (): void {
    it('should return a validation error if try to register with existing email', function (): void {
        $response = postJson('/api/register', [
            'first_name' => 'First',
            'last_name' => 'Last',
            'email' => 'mohamed@user.com',
            'password' => 'password',
            'password_confirmation' => 'password',
        ]);

        $response->assertStatus(422)
            ->assertInvalid([
                'email',
            ]);
    });

    it('should return a token after registering user successfully', function (): void {
        $response = postJson('/api/register', [
            'first_name' => 'Ali',
            'last_name' => 'Ali',
            'email' => 'ali@user.com',
            'password' => 'password',
            'password_confirmation' => 'password',
        ]);

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'access_token',
                ],
            ]);
    });

    it('should return an error if unexpected issue happened', function (): void {
        Config::set('passport.personal_access_client.secret', 'invalid-secret');

        $response = postJson('/api/register', [
            'first_name' => 'Ali',
            'last_name' => 'Ali',
            'email' => 'ali@user.com',
            'password' => 'password',
            'password_confirmation' => 'password',
        ]);

        $response->assertStatus(400)
            ->assertJson([
                'success' => false,
                'message' => 'Client authentication failed',
            ]);
    });
});

describe('Logout', function (): void {
    it('should return an error if the user is not authenticated', function (): void {
        $response = postJson('/api/logout');

        $response->assertStatus(401)
            ->assertJson([
                'message' => 'Unauthenticated.',
            ]);
    });

    it('should return a success message if the user is authenticated', function (): void {
        Passport::actingAs($this->user);

        $response = postJson('/api/logout');

        $response->assertStatus(200)
            ->assertJson([
                'success' => true,
                'message' => 'Logged out successfully',
            ]);
    });
});
