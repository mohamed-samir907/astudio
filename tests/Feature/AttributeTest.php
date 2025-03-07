<?php

use App\Enums\AttributeType;
use App\Models\Attribute;
use App\Models\User;
use Laravel\Passport\Passport;

use function Pest\Laravel\{assertDatabaseCount, assertDatabaseHas, assertDatabaseMissing, getJson, postJson, putJson, deleteJson};

beforeEach(function (): void {
    $this->user = User::factory()->create();
    Passport::actingAs($this->user);
});

describe('Index', function (): void {
    it('can see all attributes paginated', function (): void {
        Attribute::factory(5)->create();

        $response = getJson('/api/attributes');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    '*' => [
                        'id',
                        'name',
                        'type',
                        'created_at',
                        'updated_at',
                    ],
                ],
                'links',
                'meta',
            ]);

        assertDatabaseCount('attributes', 5);
    });
});

describe('Show', function (): void {
    it('returns 404 if the attribute does not exist', function (): void {
        $response = getJson('/api/attributes/1');

        $response->assertStatus(404)
            ->assertSee('Attribute not found');
    });

    it('can see the attribute', function (): void {
        $attribute = Attribute::factory()->create();

        $response = getJson("/api/attributes/{$attribute->id}");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'name',
                    'type',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment($attribute->toArray());
    });
});

describe('Create', function (): void {
    it('can not create a attribute without required fields', function (): void {
        $response = postJson('/api/attributes', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors([
                'name',
                'type',
            ]);
    });

    it('can create a attribute', function (): void {
        $data = [
            'name' => 'IT',
            'type' => AttributeType::Text->value,
        ];

        $response = postJson('/api/attributes', $data);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'name',
                    'type',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment([
                'name' => $data['name'],
                'type' => $data['type'],
            ]);

        assertDatabaseHas('attributes', $data);
    });
});

describe('Update', function (): void {
    it('can not update attribute that does not exist', function (): void {
        $response = putJson('/api/attributes/1', []);

        $response->assertStatus(404)
            ->assertSee('Attribute not found');
    });

    it('can not update attribute without payload', function (): void {
        $attribute = Attribute::factory()->create();

        $response = putJson("/api/attributes/{$attribute->id}", []);

        $response->assertStatus(422)
            ->assertSee('No data provided');
    });

    it('can update attribute', function (): void {
        $attribute = Attribute::factory()->create();

        $data = [
            'name' => 'IT',
        ];

        $response = putJson("/api/attributes/{$attribute->id}", $data);

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Updated successfully',
            ]);

        assertDatabaseHas('attributes', [
            'id' => $attribute->id,
            'name' => $data['name'],
        ]);
    });
});

describe('Delete', function (): void {
    it('can not delete attribute that does not exist', function (): void {
        $response = deleteJson('/api/attributes/1');

        $response->assertStatus(404)
            ->assertSee('Attribute not found');
    });

    it('can delete attribute', function (): void {
        $attribute = Attribute::factory()->create();

        $response = deleteJson("/api/attributes/{$attribute->id}");

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Deleted successfully',
            ]);

        assertDatabaseMissing('attributes', [
            'id' => $attribute->id,
        ]);
    });
});
