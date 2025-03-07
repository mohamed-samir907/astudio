<?php

namespace App\Repositories\Timesheet;

use App\Models\Timesheet;
use Illuminate\Contracts\Pagination\Paginator;

final class EloquentTimesheetRepository implements TimesheetRepository
{
    public function getPaginated(int $userId, int $limit = 10): Paginator
    {
        return Timesheet::query()->where('user_id', $userId)->simplePaginate($limit);
    }

    public function create(array $data): Timesheet
    {
        return Timesheet::create($data);
    }

    public function find(int $id): ?Timesheet
    {
        return Timesheet::find($id);
    }

    public function update(Timesheet $project, array $data): bool
    {
        return $project->update($data);
    }

    public function delete(Timesheet $project): bool
    {
        return $project->delete();
    }
}
