<?php

namespace App\Repositories\AttributeValue;

use App\Models\AttributeValue;
use Illuminate\Contracts\Pagination\Paginator;

final class EloquentAttributeValueRepository implements AttributeValueRepository
{
    public function getPaginated(int $limit = 10): Paginator
    {
        return AttributeValue::query()->simplePaginate($limit);
    }

    public function create(array $data): AttributeValue
    {
        return AttributeValue::create($data);
    }

    public function find(int $id): ?AttributeValue
    {
        return AttributeValue::find($id);
    }

    public function update(AttributeValue $project, array $data): bool
    {
        return $project->update($data);
    }

    public function delete(AttributeValue $project): bool
    {
        return $project->delete();
    }
}
