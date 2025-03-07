<?php

namespace App\Services;

use App\DTOs\AttributeDTO;
use App\Repositories\Attribute\AttributeRepository;
use App\Http\Resources\Attribute\AttributeCollection;
use App\Http\Resources\Attribute\AttributeResource;

final class AttributeService
{
    public function __construct(
        private AttributeRepository $attributeRepository,
    ) {}

    public function getPaginated(): AttributeCollection
    {
        return new AttributeCollection(
            $this->attributeRepository->getPaginated(),
        );
    }

    public function show(int $id): AttributeResource
    {
        $attribute = $this->attributeRepository->find($id);
        if (null === $attribute) {
            abort(404, 'Attribute not found');
        }

        return new AttributeResource($attribute);
    }

    public function create(AttributeDTO $dto): AttributeResource
    {
        $attribute = $this->attributeRepository->create($dto->toDatabase());

        return new AttributeResource($attribute);
    }

    public function update(AttributeDTO $dto, int $id): void
    {
        $attribute = $this->attributeRepository->find($id);
        if (null === $attribute) {
            abort(404, 'Attribute not found');
        }

        if (empty($dto->toDatabase())) {
            abort(422, 'No data provided');
        }

        $this->attributeRepository->update($attribute, $dto->toDatabase());
    }

    public function delete(int $id): void
    {
        $attribute = $this->attributeRepository->find($id);
        if (null === $attribute) {
            abort(404, 'Attribute not found');
        }

        $this->attributeRepository->delete($attribute);
    }
}
