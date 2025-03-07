<?php

namespace App\Repositories\AttributeValue;

use App\Models\AttributeValue;
use Illuminate\Contracts\Pagination\Paginator;

interface AttributeValueRepository
{
    /** @return Paginator<AttributeValue> */
    public function getPaginated(int $limit = 10): Paginator;

    /** @param array<string, mixed> $data */
    public function create(array $data): AttributeValue;

    public function find(int $id): ?AttributeValue;

    /** @param array<string, mixed> $data */
    public function update(AttributeValue $project, array $data): bool;

    public function delete(AttributeValue $project): bool;

    public function deleteByEntity(int $entityId): bool;
}
