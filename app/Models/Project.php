<?php

namespace App\Models;

use Illuminate\Pipeline\Pipeline;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Project extends Model
{
    /** @use HasFactory<\Database\Factories\ProjectFactory> */
    use HasFactory;

    /** @var list<string> */
    protected $fillable = [
        'name',
        'status',
    ];

    /** @return BelongsToMany<User, $this> */
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class);
    }

    /** @return HasMany<Timesheet, $this> */
    public function timesheets(): HasMany
    {
        return $this->hasMany(Timesheet::class);
    }

    /** @return HasMany<AttributeValue, $this> */
    public function attributeValues(): HasMany
    {
        return $this->hasMany(AttributeValue::class, 'entity_id');
    }

    /**
     * @param  Builder<Project> $query
     * @param  Collection<string, mixed> $filters
     * @return Builder<Project>
     */
    public function scopeFilter(Builder $query, Collection $filters): Builder
    {
        return $query->where(
            fn($builder) => app(Pipeline::class)
                ->send($builder)
                ->through([
                    new \App\Filters\Project\NameFilter($filters),
                    new \App\Filters\Project\StatusFilter($filters),
                    new \App\Filters\Project\AttributesFilter($filters),
                ])
                ->via('apply')
                ->thenReturn(),
        );
    }
}
