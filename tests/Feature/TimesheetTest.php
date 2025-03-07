<?php

use App\Models\User;
use App\Models\Project;
use App\Models\Timesheet;
use Laravel\Passport\Passport;

use function Pest\Laravel\{assertDatabaseHas, assertDatabaseMissing, getJson, postJson, putJson, deleteJson};

beforeEach(function (): void {
    $this->user = User::factory()->create();
    Passport::actingAs($this->user);
});

describe('Index', function (): void {
    it('can see his all timesheets paginated', function (): void {
        Timesheet::factory(5)->create([
            'user_id' => $this->user->id,
        ]);

        $timesheet = Timesheet::factory()->create();

        $response = getJson('/api/timesheets');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    '*' => [
                        'id',
                        'task_name',
                        'date',
                        'hours',
                        'created_at',
                        'updated_at',
                    ],
                ],
                'links',
                'meta',
            ]);

        assertDatabaseMissing('timesheets', [
            'id' => $timesheet->id,
            'user_id' => $this->user->id,
        ]);
    });
});

describe('Show', function (): void {
    it("can not see other users's timesheets", function (): void {
        $user = User::factory()->create();
        $timesheet = Timesheet::factory()->create([
            'user_id' => $user->id,
        ]);

        $response = getJson("/api/timesheets/{$timesheet->id}");

        $response->assertStatus(403)
            ->assertSee('You do not have access to this timesheet');
    });

    it('can return 404 if the timesheet does not exist', function (): void {
        $response = getJson('/api/timesheets/10000000');

        $response->assertStatus(404)
            ->assertSee('Timesheet not found');
    });

    it('can see the timesheet', function (): void {
        $timesheet = Timesheet::factory()->create([
            'user_id' => $this->user->id,
        ]);

        $response = getJson("/api/timesheets/{$timesheet->id}");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'task_name',
                    'date',
                    'hours',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment([
                'id' => $timesheet->id,
                'task_name' => $timesheet->task_name,
                'date' => $timesheet->date,
                'hours' => $timesheet->hours,
            ]);
    });
});

describe('Create', function (): void {
    it('can not create a timesheet without required fields', function (): void {
        $response = postJson('/api/timesheets', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors([
                'task_name',
                'date',
                'hours',
            ]);
    });

    it('can create a timesheet', function (): void {
        $data = [
            'task_name' => 'Task 1',
            'date' => "2025-03-07",
            'hours' => 8,
            'project_id' => Project::factory()->create()->id,
        ];

        $response = postJson('/api/timesheets', $data);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'task_name',
                    'date',
                    'hours',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment([
                'task_name' => $data['task_name'],
                'date' => $data['date'],
                'hours' => $data['hours'],
            ]);
    });
});

describe('Update', function (): void {
    it('can not update timesheet that does not exist', function (): void {
        $response = putJson('/api/timesheets/1', []);

        $response->assertStatus(404)
            ->assertSee('Timesheet not found');
    });

    it("can not update timesheet for other user", function (): void {
        $timesheet = Timesheet::factory()->create();

        $response = putJson("/api/timesheets/{$timesheet->id}", []);

        $response->assertStatus(403)
            ->assertSee('You do not have access to this timesheet');
    });

    it('can not update timesheet without payload', function (): void {
        $timesheet = Timesheet::factory()->create([
            'user_id' => $this->user->id,
        ]);

        $response = putJson("/api/timesheets/{$timesheet->id}", []);

        $response->assertStatus(422)
            ->assertSee('No data provided');
    });

    it('can update his timesheet', function (): void {
        $timesheet = Timesheet::factory()->create([
            'user_id' => $this->user->id,
        ]);

        $data = [
            'date' => '2025-03-07',
            'hours' => 20,
        ];

        $response = putJson("/api/timesheets/{$timesheet->id}", $data);

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Updated successfully',
            ]);

        assertDatabaseHas('timesheets', [
            'id' => $timesheet->id,
            'date' => $data['date'],
            'hours' => $data['hours'],
        ]);
    });
});

describe('Delete', function (): void {
    it('can not delete timesheet that does not exist', function (): void {
        $response = deleteJson('/api/timesheets/1');

        $response->assertStatus(404)
            ->assertSee('Timesheet not found');
    });

    it("can not delete timesheet for other user", function (): void {
        $timesheet = Timesheet::factory()->create();

        $response = deleteJson("/api/timesheets/{$timesheet->id}");

        $response->assertStatus(403)
            ->assertSee('You do not have access to this timesheet');
    });

    it('can delete his timesheet', function (): void {
        $timesheet = Timesheet::factory()->create([
            'user_id' => $this->user->id,
        ]);

        $response = deleteJson("/api/timesheets/{$timesheet->id}");

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Deleted successfully',
            ]);

        assertDatabaseMissing('timesheets', [
            'id' => $timesheet->id,
        ]);
    });
});
