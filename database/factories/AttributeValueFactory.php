<?php

namespace Database\Factories;

use App\Models\Project;
use App\Models\Attribute;
use App\Enums\AttributeType;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\AttributeValue>
 */
class AttributeValueFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'attribute_id' => Attribute::factory()->create()->id,
            'entity_id' => Project::factory()->create()->id,
            'value' => fake()->word(),
        ];
    }

    public function withAttribute(Attribute $attribute): self
    {
        return $this->state(function (array $attributes) use ($attribute) {
            $value = match ($attribute->type) {
                AttributeType::Number->value => fake()->randomNumber(),
                AttributeType::Date->value => fake()->date(),
                AttributeType::Select->value => json_encode(fake()->words()),
                default => fake()->word(),
            };

            return [
                'attribute_id' => $attribute->id,
                'value' => $value,
            ];
        });
    }
}
