<?php

namespace App\Enums;

enum AttributeType: string
{
    case Text = 'text';
    case Date = 'date';
    case Number = 'number';
    case Select = 'select';

    /** @return array<string> */
    public static function values(): array
    {
        return array_map(fn(AttributeType $type) => $type->value, self::cases());
    }
}
