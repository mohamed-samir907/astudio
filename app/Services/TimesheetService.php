<?php

namespace App\Services;

use App\DTOs\TimesheetDTO;
use Illuminate\Support\Facades\Auth;
use App\Repositories\Timesheet\TimesheetRepository;
use App\Http\Resources\Timesheet\TimesheetCollection;
use App\Http\Resources\Timesheet\TimesheetResource;
use App\Models\Timesheet;

final class TimesheetService
{
    public function __construct(
        private TimesheetRepository $timesheetRepository,
    ) {}

    public function getPaginated(): TimesheetCollection
    {
        return new TimesheetCollection(
            $this->timesheetRepository->getPaginated(
                (int) Auth::id(),
            ),
        );
    }

    public function show(int $id): TimesheetResource
    {
        $timesheet = $this->findAndCheckAccess($id);

        return new TimesheetResource($timesheet);
    }

    public function create(TimesheetDTO $dto): TimesheetResource
    {
        $timesheet = $this->timesheetRepository->create($dto->toDatabase() + ['user_id' => Auth::id()]);

        return new TimesheetResource($timesheet);
    }

    public function update(TimesheetDTO $dto, int $id): void
    {
        $timesheet = $this->findAndCheckAccess($id);

        if (empty($dto->toDatabase())) {
            abort(422, 'No data provided');
        }

        $this->timesheetRepository->update($timesheet, $dto->toDatabase());
    }

    public function delete(int $id): void
    {
        $timesheet = $this->findAndCheckAccess($id);

        $this->timesheetRepository->delete($timesheet);
    }

    /**
     * Check if the user exists and has access to the project.
     */
    private function findAndCheckAccess(int $id): Timesheet
    {
        $timesheet = $this->timesheetRepository->find($id);
        if (! $timesheet) {
            abort(404, 'Timesheet not found');
        }

        if ($timesheet->user_id !== Auth::id()) {
            abort(403, 'You do not have access to this timesheet');
        }

        return $timesheet;
    }
}
