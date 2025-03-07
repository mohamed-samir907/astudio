<?php

namespace App\DTOs;

use Illuminate\Http\Request;
use App\Contracts\DTOInterface;

readonly class AttributeValueDTO implements DTOInterface
{
    public function __construct(
        public ?int $entityId,
        public ?int $attributeId,
        public ?string $value,
    ) {}

    public static function fromRequest(Request $request): self
    {
        return new self(
            entityId: $request->get('entity_id'),
            attributeId: $request->get('attribute_id'),
            value: $request->get('value'),
        );
    }

    public function toDatabase(): array
    {
        return array_filter([
            'attribute_id' => $this->attributeId,
            'entity_id' => $this->entityId,
            'value' => $this->value,
        ]);
    }
}
