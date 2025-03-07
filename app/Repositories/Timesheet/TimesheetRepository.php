<?php

namespace App\Repositories\Timesheet;

use App\Models\Timesheet;
use Illuminate\Contracts\Pagination\Paginator;

interface TimesheetRepository
{
    /** @return Paginator<Timesheet> */
    public function getPaginated(int $userId, int $limit = 10): Paginator;

    /** @param array<string, mixed> $data */
    public function create(array $data): Timesheet;

    public function find(int $id): ?Timesheet;

    /** @param array<string, mixed> $data */
    public function update(Timesheet $project, array $data): bool;

    public function delete(Timesheet $project): bool;
}
