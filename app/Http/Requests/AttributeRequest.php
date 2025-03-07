<?php

namespace App\Http\Requests;

use App\Enums\AttributeType;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rules\Enum;

class AttributeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        if ($this->isMethod('put')) {
            return [
                'name' => ['sometimes', 'string', 'max:255'],
                'type' => ['sometimes', new Enum(AttributeType::class)],
            ];
        }

        return [
            'name' => ['required', 'string', 'max:255'],
            'type' => ['required', new Enum(AttributeType::class)],
        ];
    }
}
