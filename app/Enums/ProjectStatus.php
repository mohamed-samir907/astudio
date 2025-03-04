<?php

namespace App\Enums;

enum ProjectStatus: string
{
    case Pending = 'pending';
    case InProgress = 'in_progress';
    case Completed = 'completed';
    case Canceled = 'canceled';
    case Archived = 'archived';

    /** @return array<string> */
    public static function values(): array
    {
        return array_map(fn(ProjectStatus $status) => $status->value, self::cases());
    }
}
