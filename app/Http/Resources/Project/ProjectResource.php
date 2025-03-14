<?php

namespace App\Http\Resources\Project;

use App\Models\AttributeValue;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProjectResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'status' => $this->status,
            'attributes' => $this->attributeValues->map(function (AttributeValue $attributeValue) {
                return [
                    'id' => $attributeValue->id,
                    'attribute_id' => $attributeValue->attribute_id,
                    'name' => $attributeValue->attribute->name,
                    'type' => $attributeValue->attribute->type,
                    'value' => $attributeValue->value,
                ];
            }),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
