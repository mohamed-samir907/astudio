<?php

namespace App\Repositories\Attribute;

use App\Models\Attribute;
use Illuminate\Contracts\Pagination\Paginator;

interface AttributeRepository
{
    /** @return Paginator<Attribute> */
    public function getPaginated(int $limit = 10): Paginator;

    /** @param array<string, mixed> $data */
    public function create(array $data): Attribute;

    public function find(int $id): ?Attribute;

    /** @param array<string, mixed> $data */
    public function update(Attribute $project, array $data): bool;

    public function delete(Attribute $project): bool;
}
