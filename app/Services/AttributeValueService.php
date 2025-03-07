<?php

namespace App\Services;

use App\DTOs\AttributeValueDTO;
use App\Http\Resources\AttributeValue\AttributeValueCollection;
use App\Http\Resources\AttributeValue\AttributeValueResource;
use App\Repositories\AttributeValue\AttributeValueRepository;

final class AttributeValueService
{
    public function __construct(
        private AttributeValueRepository $attributeValueRepository,
    ) {}

    public function getPaginated(): AttributeValueCollection
    {
        return new AttributeValueCollection(
            $this->attributeValueRepository->getPaginated(),
        );
    }

    public function show(int $id): AttributeValueResource
    {
        $attribute = $this->attributeValueRepository->find($id);
        if (null === $attribute) {
            abort(404, 'AttributeValue not found');
        }

        return new AttributeValueResource($attribute);
    }

    public function create(AttributeValueDTO $dto): AttributeValueResource
    {
        $attribute = $this->attributeValueRepository->create($dto->toDatabase());

        return new AttributeValueResource($attribute);
    }

    public function update(AttributeValueDTO $dto, int $id): void
    {
        $attribute = $this->attributeValueRepository->find($id);
        if (null === $attribute) {
            abort(404, 'AttributeValue not found');
        }

        $this->attributeValueRepository->update($attribute, $dto->toDatabase());
    }

    public function delete(int $id): void
    {
        $attribute = $this->attributeValueRepository->find($id);
        if (null === $attribute) {
            abort(404, 'AttributeValue not found');
        }

        $this->attributeValueRepository->delete($attribute);
    }
}
