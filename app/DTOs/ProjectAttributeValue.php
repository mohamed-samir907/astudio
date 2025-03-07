<?php

namespace App\DTOs;

readonly class ProjectAttributeValue
{
    public function __construct(
        public int $attributeId,
        public string $value,
    ) {}
}
