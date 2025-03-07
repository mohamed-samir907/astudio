<?php

namespace App\DTOs;

use Illuminate\Http\Request;
use App\Contracts\DTOInterface;
use Illuminate\Support\Facades\Auth;

readonly class TimesheetDTO implements DTOInterface
{
    public function __construct(
        public int $userId,
        public ?int $projectId,
        public ?string $taskName,
        public ?string $date,
        public ?float $hours,
    ) {}

    public static function fromRequest(Request $request): self
    {
        return new self(
            taskName: $request->get('task_name'),
            date: $request->get('date'),
            hours: $request->get('hours'),
            userId: (int) Auth::id(),
            projectId: $request->get('project_id'),
        );
    }

    public function toDatabase(): array
    {
        return array_filter([
            'project_id' => $this->projectId,
            'task_name' => $this->taskName,
            'date' => $this->date,
            'hours' => $this->hours,
        ]);
    }
}
