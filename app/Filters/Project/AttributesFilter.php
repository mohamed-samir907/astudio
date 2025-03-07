<?php

namespace App\Filters\Project;

use App\Filters\BaseFilter;
use Closure;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Schema;

final class AttributesFilter extends BaseFilter
{
    public function apply(Builder &$query, Closure $next): Builder
    {
        foreach ($this->filters as $key => $value) {
            if (Schema::hasColumn('projects', $key)) {
                continue;
            }

            $query->whereHas('attributeValues.attribute', function ($q) use ($key, $value): void {
                $q->where('name', $key);

                if ($this->isValidFieldArray($value, ['like', '=', '>', '<'])) {
                    $val = 'like' === $value['op'] ? "{$value['val']}%" : $value['val'];

                    $q->where('attribute_values.value', $value['op'], $val);
                } else {
                    $q->where('attribute_values.value', $value);
                }
            });
        }

        return $next($query);
    }
}
