<?php

use App\Enums\ProjectStatus;
use App\Models\User;
use App\Models\Project;
use Laravel\Passport\Passport;

use function Pest\Laravel\{assertDatabaseHas, assertDatabaseMissing, getJson, postJson, putJson, deleteJson};

beforeEach(function (): void {
    $this->user = User::factory()->create();
    Passport::actingAs($this->user);
});

describe('Index', function (): void {
    it('can see his all projects paginated', function (): void {
        $projects = Project::factory(5)->create();
        $this->user->projects()->attach($projects->pluck('id')->toArray());

        $project = Project::factory()->create();

        $response = getJson('/api/projects');

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    '*' => [
                        'id',
                        'name',
                        'status',
                        'created_at',
                        'updated_at',
                    ],
                ],
                'links',
                'meta',
            ])
            ->assertJsonFragments($projects->toArray());

        assertDatabaseMissing('project_user', [
            'project_id' => $project->id,
            'user_id' => $this->user->id,
        ]);
    });
});

describe('Show', function (): void {
    it("can not see projects he not assigned to it", function (): void {
        $project = Project::factory()->create();

        $response = getJson("/api/projects/{$project->id}");

        $response->assertStatus(403)
            ->assertSee('You do not have access to this project');
    });

    it('can return 404 if the project does not exist', function (): void {
        $response = getJson('/api/projects/10000000');

        $response->assertStatus(404)
            ->assertSee('Project not found');
    });

    it('can see the project', function (): void {
        $project = Project::factory()->create();
        $this->user->projects()->attach($project->id);

        $response = getJson("/api/projects/{$project->id}");

        $response->assertStatus(200)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'name',
                    'status',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment($project->toArray());
    });
});

describe('Create', function (): void {
    it('can not create a project without required fields', function (): void {
        $response = postJson('/api/projects', []);

        $response->assertStatus(422)
            ->assertJsonValidationErrors([
                'name',
                'status',
            ]);
    });

    it('can create a project', function (): void {
        $data = [
            'name' => 'Project 1',
            'status' => ProjectStatus::Completed,
        ];

        $response = postJson('/api/projects', $data);

        $response->assertStatus(201)
            ->assertJsonStructure([
                'success',
                'message',
                'data' => [
                    'id',
                    'name',
                    'status',
                    'created_at',
                    'updated_at',
                ],
            ])
            ->assertJsonFragment([
                'name' => $data['name'],
                'status' => $data['status'],
            ]);
    });
});

describe('Update', function (): void {
    it('can not update project that does not exist', function (): void {
        $response = putJson('/api/projects/1', []);

        $response->assertStatus(404)
            ->assertSee('Project not found');
    });

    it("can not update project not assigned to it", function (): void {
        $project = Project::factory()->create();

        $response = putJson("/api/projects/{$project->id}", []);

        $response->assertStatus(403)
            ->assertSee('You do not have access to this project');
    });

    it('can not update project without payload', function (): void {
        $project = Project::factory()->create();
        $project->users()->attach($this->user->id);

        $response = putJson("/api/projects/{$project->id}", []);

        $response->assertStatus(422)
            ->assertSee('No data provided');
    });

    it('can update his project', function (): void {
        $project = Project::factory()->create();
        $project->users()->attach($this->user->id);

        $data = [
            'name' => 'Project 1',
            'status' => ProjectStatus::Completed,
        ];

        $response = putJson("/api/projects/{$project->id}", $data);

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Updated successfully',
            ]);

        assertDatabaseHas('projects', [
            'id' => $project->id,
            'name' => $data['name'],
            'status' => $data['status'],
        ]);
    });

    it('can add users to the project', function (): void {
        $project = Project::factory()->create();
        $project->users()->attach($this->user->id);

        $users = User::factory(3)->create();
        $data = [
            'users' => $users->pluck('id')->toArray(),
        ];

        $response = putJson("/api/projects/{$project->id}", $data);

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Updated successfully',
            ]);

        $project->refresh();

        expect($project->users()->count())->toBe(4);
    });
});

describe('Delete', function (): void {
    it('can not delete project that does not exist', function (): void {
        $response = deleteJson('/api/projects/1');

        $response->assertStatus(404)
            ->assertSee('Project not found');
    });

    it("can not delete project not assigned to it", function (): void {
        $project = Project::factory()->create();

        $response = deleteJson("/api/projects/{$project->id}");

        $response->assertStatus(403)
            ->assertSee('You do not have access to this project');
    });

    it('can delete his project', function (): void {
        $project = Project::factory()->create();
        $project->users()->attach($this->user->id);

        $response = deleteJson("/api/projects/{$project->id}");

        $response->assertStatus(200)
            ->assertJsonFragment([
                'success' => true,
                'message' => 'Deleted successfully',
            ]);

        expect(Project::find($project->id))->toBeNull();
    });
});
