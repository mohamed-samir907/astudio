<?php

namespace App\DTOs;

use Illuminate\Http\Request;
use App\Contracts\DTOInterface;
use App\Enums\AttributeType;

readonly class AttributeDTO implements DTOInterface
{
    public function __construct(
        public ?string $name,
        public ?AttributeType $type,
    ) {}

    public static function fromRequest(Request $request): self
    {
        return new self(
            name: $request->get('name'),
            type: $request->has('type') ? AttributeType::tryFrom($request->get('type')) : null,
        );
    }

    public function toDatabase(): array
    {
        return array_filter([
            'name' => $this->name,
            'type' => $this->type?->value,
        ]);
    }
}
