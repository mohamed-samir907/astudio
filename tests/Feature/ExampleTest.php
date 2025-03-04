<?php

namespace Tests\Feature;

test('the application returns a successful response', function (): void {
    $response = $this->get('/');

    $response->assertStatus(200);
});
