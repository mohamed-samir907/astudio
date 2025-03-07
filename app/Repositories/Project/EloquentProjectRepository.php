<?php

namespace App\Repositories\Project;

use App\Models\User;
use App\Models\Project;
use Illuminate\Contracts\Pagination\Paginator;

final class EloquentProjectRepository implements ProjectRepository
{
    public function getPaginatedForUser(User $user, int $limit = 10): Paginator
    {
        return $user->projects()->with('attributeValues.attribute')->simplePaginate($limit);
    }

    public function create(array $data): Project
    {
        return Project::query()->create($data);
    }

    public function assignUsers(Project $project, array $users): void
    {
        $project->users()->attach($users);
    }

    public function removeUsers(Project $project, ?array $users = null): void
    {
        $project->users()->detach($users);
    }

    public function hasUser(Project $project, int $userId): bool
    {
        return $project->users()->where('user_id', $userId)->exists();
    }

    public function find(int $id): ?Project
    {
        return Project::query()->find($id);
    }

    public function update(Project $project, array $data): bool
    {
        return $project->update($data);
    }

    public function delete(Project $project): bool
    {
        return $project->delete();
    }
}
