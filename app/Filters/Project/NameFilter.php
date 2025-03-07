<?php

namespace App\Filters\Project;

use App\Filters\BaseFilter;
use Closure;
use Illuminate\Database\Eloquent\Builder;

final class NameFilter extends BaseFilter
{
    public function apply(Builder &$query, Closure $next): Builder
    {
        if (! $this->filters->has('name')) {
            return $next($query);
        }

        $name = $this->filters->get('name');

        if ($this->isValidFieldArray($name, ['like', '='])) {
            $val = 'like' === $name['op'] ? "{$name['val']}%" : $name['val'];

            $query->where('name', $name['op'], $val);
        } else {
            $query->where('name', $name);
        }

        return $next($query);
    }
}
