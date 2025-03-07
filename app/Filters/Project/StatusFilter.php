<?php

namespace App\Filters\Project;

use App\Filters\BaseFilter;
use Closure;
use Illuminate\Database\Eloquent\Builder;

final class StatusFilter extends BaseFilter
{
    public function apply(Builder &$query, Closure $next): Builder
    {
        if (! $this->filters->has('status')) {
            return $next($query);
        }

        $status = $this->filters->get('status');

        $val = $this->isValidFieldArray($status, ['=']) ? $status['val'] : $status;

        $query->where('status', $val);

        return $next($query);
    }
}
