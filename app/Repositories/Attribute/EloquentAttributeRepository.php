<?php

namespace App\Repositories\Attribute;

use App\Models\Attribute;
use Illuminate\Contracts\Pagination\Paginator;

final class EloquentAttributeRepository implements AttributeRepository
{
    public function getPaginated(int $limit = 10): Paginator
    {
        return Attribute::query()->simplePaginate($limit);
    }

    public function create(array $data): Attribute
    {
        return Attribute::create($data);
    }

    public function find(int $id): ?Attribute
    {
        return Attribute::find($id);
    }

    public function update(Attribute $project, array $data): bool
    {
        return $project->update($data);
    }

    public function delete(Attribute $project): bool
    {
        return $project->delete();
    }
}
