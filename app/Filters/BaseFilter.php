<?php

namespace App\Filters;

use Closure;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

abstract class BaseFilter
{
    public function __construct(
        /** @var Collection<string, mixed> */
        protected Collection $filters,
    ) {}

    /**
     * Apply the filter to the query builder.
     *
     * @param  Builder<\Illuminate\Database\Eloquent\Model> $query
     * @return Builder<\Illuminate\Database\Eloquent\Model>
     */
    abstract public function apply(Builder &$query, Closure $next): Builder;

    /** @param string[] $in */
    protected function isValidFieldArray(mixed $field, array $in): bool
    {
        if (! is_array($field)) {
            return false;
        }

        return ! (! isset($field['val']) || ! isset($field['op']) || ! in_array($field['op'], $in));
    }
}
