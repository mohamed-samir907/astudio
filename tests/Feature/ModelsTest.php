<?php

namespace Tests\Feature;

use App\Models\User;
use App\Models\Project;
use App\Models\Attribute;
use App\Models\Timesheet;
use App\Models\AttributeValue;

describe('User', function (): void {
    it('can be created', function (): void {
        $user = User::factory()->create();

        expect($user)->toBeInstanceOf(User::class);
    });

    test('assigned to multiple projects', function (): void {
        $projects = Project::factory(3)->create();

        $user = User::factory()->create();
        $user->projects()->attach($projects->pluck('id')->toArray());

        expect($user->projects)->toHaveCount(3);
    });

    test('has many timesheets', function (): void {
        $user = User::factory()->create();

        Timesheet::factory(3)->create(['user_id' => $user->id]);

        expect($user->timesheets)->toHaveCount(3);
    });
});

describe('Project', function (): void {
    it('has many users', function (): void {
        $project = Project::factory()->create();

        $users = User::factory(3)->create();
        $project->users()->attach($users->pluck('id')->toArray());

        expect($project->users)->toHaveCount(3);
    });

    it('has many timesheets', function (): void {
        $project = Project::factory()->create();

        Timesheet::factory(3)->create(['project_id' => $project->id]);

        expect($project->timesheets)->toHaveCount(3);
    });

    it('has many attribute values', function (): void {
        $project = Project::factory()->create();

        AttributeValue::factory(3)->create(['entity_id' => $project->id]);

        expect($project->attributeValues)->toHaveCount(3);
    });
});

describe('Timesheet', function (): void {
    it('is related to a users', function (): void {
        $user = User::factory()->create();

        $timesheet = Timesheet::factory()->create(['user_id' => $user->id]);

        expect($timesheet->user->id)->toBe($user->id);
    });

    it('is related to a project', function (): void {
        $project = Project::factory()->create();

        $timesheet = Timesheet::factory()->create(['project_id' => $project->id]);

        expect($timesheet->project->id)->toBe($project->id);
    });
});

describe('Attribute', function (): void {
    it('has many attribute values', function (): void {
        $attribute = Attribute::factory()->create();

        AttributeValue::factory(3)->create(['attribute_id' => $attribute->id]);

        expect($attribute->attributeValues)->toHaveCount(3);
    });
});

describe('AttributeValue', function (): void {
    it('is related to an attribute', function (): void {
        $attribute = Attribute::factory()->create();

        $attributeValue = AttributeValue::factory()->create(['attribute_id' => $attribute->id]);

        expect($attributeValue->attribute->id)->toBe($attribute->id);
    });

    it('is related to an entity', function (): void {
        $project = Project::factory()->create();

        $attributeValue = AttributeValue::factory()->create(['entity_id' => $project->id]);

        expect($attributeValue->entity->id)->toBe($project->id);
    });
});
