<?php

namespace App\Services;

use App\Models\Project;
use App\DTOs\ProjectDTO;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Project\ProjectResource;
use App\Repositories\Project\ProjectRepository;
use App\Http\Resources\Project\ProjectCollection;
use App\Repositories\AttributeValue\AttributeValueRepository;

final class ProjectService
{
    public function __construct(
        private ProjectRepository $projectRepository,
        private AttributeValueRepository $attributeValueRepository,
    ) {}

    public function getPaginated(): ProjectCollection
    {
        return new ProjectCollection(
            $this->projectRepository->getPaginatedForUser(
                Auth::user(),
            ),
        );
    }

    public function create(ProjectDTO $dto): ProjectResource
    {
        $project = $this->projectRepository->create($dto->toDatabase());

        $users = array_unique(array_merge($dto->users, [Auth::id()]));

        $this->projectRepository->assignUsers($project, $users);

        if (! empty($dto->attributes)) {
            foreach ($dto->attributes as $attribute) {
                $this->attributeValueRepository->create([
                    'attribute_id' => $attribute->attributeId,
                    'entity_id' => $project->id,
                    'value' => $attribute->value,
                ]);
            }
        }

        return new ProjectResource($project);
    }

    public function show(int $id): ProjectResource
    {
        $project = $this->findAndCheckAccess($id);

        return new ProjectResource($project);
    }

    public function update(ProjectDTO $dto, int $id): void
    {
        $project = $this->findAndCheckAccess($id);

        if (empty($dto->toDatabase()) && empty($dto->users) && empty($dto->attributes)) {
            abort(422, 'No data provided');
        }

        $this->projectRepository->update($project, $dto->toDatabase());

        if (! empty($dto->users)) {
            $this->projectRepository->removeUsers($project);

            $users = array_unique(array_merge($dto->users, [Auth::id()]));

            $this->projectRepository->assignUsers($project, $users);
        }

        if (! empty($dto->attributes)) {
            $this->attributeValueRepository->deleteByEntity($project->id);

            foreach ($dto->attributes as $attribute) {
                $this->attributeValueRepository->create([
                    'attribute_id' => $attribute->attributeId,
                    'entity_id' => $project->id,
                    'value' => $attribute->value,
                ]);
            }
        }
    }

    public function delete(int $id): void
    {
        $project = $this->findAndCheckAccess($id);

        $this->projectRepository->delete($project);
    }

    /**
     * Check if the user exists and has access to the project.
     */
    private function findAndCheckAccess(int $id): Project
    {
        $project = $this->projectRepository->find($id);
        if (! $project) {
            abort(404, 'Project not found');
        }

        if (! $this->projectRepository->hasUser($project, (int) Auth::id())) {
            abort(403, 'You do not have access to this project');
        }

        return $project;
    }
}
