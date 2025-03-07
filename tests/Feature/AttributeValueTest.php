<?php

use App\Models\Attribute;
use App\Models\AttributeValue;
use App\Models\Project;
use App\Models\User;
use Laravel\Passport\Passport;

use function Pest\Laravel\{assertDatabaseCount, assertDatabaseHas, assertDatabaseMissing, getJson, postJson, putJson, deleteJson};

beforeEach(function (): void {
    $this->user = User::factory()->create();
    Passport::actingAs($this->user);
});

describe('Index', function (): void {
    it('can see all attribute values paginated', function (): void {
        AttributeValue::factory(5)->create();

        $response = getJson('/api/attribute-values');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    '*' => [
                        'id',
                        'attribute_id',
                        'entity_id',
                        'value',
                        'created_at',
                        'updated_at',
                    ],
                ],
                'links',
                'meta',
            ]);

        assertDatabaseCount('attribute_values', 5);
    });
});

describe('Show', function (): void {
    it('returns 404 if the attribute value does not exist', function (): void {
        $response = getJson('/api/attribute-values/1');

        $response->assertStatus(404)
            ->assertSee('AttributeValue not found');
    });

    it('can see the attribute value', function (): void {
        $value = AttributeValue::factory()->create();

        $response = getJson("/api/attribute-values/{$value->id}");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'attribute_id',
                    'entity_id',
                    'value',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment($value->toArray());
    });
});

describe('Create', function (): void {
    it('can not create a attribute value without required fields', function (): void {
        $response = postJson('/api/attribute-values', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors([
                'attribute_id',
                'entity_id',
                'value',
            ]);
    });

    it('can create a attribute value', function (): void {
        $data = [
            'attribute_id' => Attribute::factory()->create()->id,
            'entity_id' => Project::factory()->create()->id,
            'value' => 'IT',
        ];

        $response = postJson('/api/attribute-values', $data);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'attribute_id',
                    'entity_id',
                    'value',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment([
                'attribute_id' => $data['attribute_id'],
                'entity_id' => $data['entity_id'],
                'value' => $data['value'],
            ]);

        assertDatabaseHas('attribute_values', $data);
    });
});

describe('Update', function (): void {
    it('can not update attribute value that does not exist', function (): void {
        $response = putJson('/api/attribute-values/1', [
            'value' => 'IT',
        ]);

        $response->assertStatus(404)
            ->assertSee('AttributeValue not found');
    });

    it('can update attribute', function (): void {
        $value = AttributeValue::factory()->create();

        $data = [
            'value' => 'IT',
        ];

        $response = putJson("/api/attribute-values/{$value->id}", $data);

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Updated successfully',
            ]);

        assertDatabaseHas('attribute_values', [
            'id' => $value->id,
            'value' => $data['value'],
        ]);
    });
});

describe('Delete', function (): void {
    it('can not delete attribute that does not exist', function (): void {
        $response = deleteJson('/api/attribute-values/1');

        $response->assertStatus(404)
            ->assertSee('AttributeValue not found');
    });

    it('can delete attribute', function (): void {
        $value = AttributeValue::factory()->create();

        $response = deleteJson("/api/attribute-values/{$value->id}");

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Deleted successfully',
            ]);

        assertDatabaseMissing('attribute_values', [
            'id' => $value->id,
        ]);
    });
});
