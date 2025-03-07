<?php

namespace Database\Seeders;

use App\Enums\AttributeType;
use App\Models\Attribute;
use App\Models\AttributeValue;
use App\Models\Project;
use App\Models\Timesheet;
use App\Models\User;
use Illuminate\Database\Seeder;

class AppSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // create users
        $admin = User::factory()->create([
            'first_name' => 'Super',
            'last_name' => 'Admin',
            'email' => 'admin@user.com',
        ]);

        $users = User::factory(10)->create();

        $ids = collect($users->pluck('id')->toArray())->merge($admin->id);

        // create projects
        $projects = Project::factory(10)->create();

        // create attributes
        $attributes = [
            Attribute::factory()->create(['name' => 'budget', 'type' => AttributeType::Number->value]),
            Attribute::factory()->create(['name' => 'department', 'type' => AttributeType::Text->value]),
            Attribute::factory()->create(['name' => 'start_date', 'type' => AttributeType::Date->value]),
            Attribute::factory()->create(['name' => 'end_date', 'type' => AttributeType::Date->value]),
        ];

        foreach ($projects as $project) {
            $randomIds = $ids->random(3)->toArray();

            // assign attributes to projects
            foreach ($attributes as $attribute) {
                AttributeValue::factory()->withAttribute($attribute)->create([
                    'entity_id' => $project->id,
                ]);
            }

            // assign users to projects
            $project->users()->attach($randomIds);

            // log users working time on the project
            foreach ($randomIds as $id) {
                Timesheet::factory(3)->create([
                    'project_id' => $project->id,
                    'user_id' => $id,
                ]);
            }
        }
    }
}
