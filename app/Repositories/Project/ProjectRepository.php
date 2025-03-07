<?php

namespace App\Repositories\Project;

use App\Models\User;
use App\Models\Project;
use Illuminate\Contracts\Pagination\Paginator;

interface ProjectRepository
{
    /** @return Paginator<Project> */
    public function getPaginatedForUser(User $user, int $limit = 10): Paginator;

    /** @param array<string, mixed> $data */
    public function create(array $data): Project;

    /** @param array<int|string|null> $users */
    public function assignUsers(Project $project, array $users): void;

    /** @param array<int|string|null>|null $users */
    public function removeUsers(Project $project, ?array $users = null): void;

    public function hasUser(Project $project, int $userId): bool;

    public function find(int $id): ?Project;

    /** @param array<string, mixed> $data */
    public function update(Project $project, array $data): bool;

    public function delete(Project $project): bool;
}
