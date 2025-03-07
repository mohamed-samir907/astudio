<?php

namespace Database\Factories;

use App\Models\Project;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Timesheet>
 */
class TimesheetFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory()->create()->id,
            'project_id' => Project::factory()->create()->id,
            'task_name' => fake()->words(10, true),
            'date' => fake()->dateTimeThisYear()->format('Y-m-d'),
            'hours' => fake()->randomFloat(2, 0, 24),
        ];
    }
}
