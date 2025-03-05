<?php

namespace Database\Seeders;

use Laravel\Passport\Passport;
use Illuminate\Database\Seeder;

class PassportPersonalClientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $client = Passport::client()->forceFill([
            'id' => '9e5af76b-7c02-4103-8d2c-9d65861f2f79',
            'user_id' => null,
            'name' => 'Personal Access Client',
            'secret' => 'secret',
            'provider' => null,
            'redirect' => 'http://localhost',
            'personal_access_client' => true,
            'password_client' => false,
            'revoked' => false,
        ]);

        $client->save();

        $client = tap($client, function ($client): void {
            $accessClient = Passport::personalAccessClient();
            $accessClient->client_id = $client->getKey();
            $accessClient->save();
        });
    }
}
