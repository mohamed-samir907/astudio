<?php

namespace App\DTOs;

use App\Enums\ProjectStatus;
use Illuminate\Http\Request;
use App\Contracts\DTOInterface;

readonly class ProjectDTO implements DTOInterface
{
    public function __construct(
        public ?string $name,
        public ?ProjectStatus $status,
        /** @var int[] */
        public array $users = [],
        /** @var ProjectAttributeValue[] */
        public array $attributes = [],
    ) {}

    public static function fromRequest(Request $request): self
    {
        /** @var array<int, array{attribute_id: int, value: string}> $attributes */
        $attributes = $request->get('attributes', []);

        /** @var array<int, ProjectAttributeValue> $attributes */
        $attributes = collect($attributes)
            ->map(
                fn($attribute) => new ProjectAttributeValue(
                    attributeId: $attribute['attribute_id'],
                    value: $attribute['value'],
                ),
            )
            ->toArray();

        return new self(
            name: $request->get('name'),
            status: $request->has('status') ? ProjectStatus::tryFrom($request->get('status')) : null,
            users: $request->get('users', []),
            attributes: $attributes,
        );
    }

    public function toDatabase(): array
    {
        return array_filter([
            'name' => $this->name,
            'status' => $this->status,
        ]);
    }
}
