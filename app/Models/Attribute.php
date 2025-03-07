<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Attribute extends Model
{
    /** @use HasFactory<\Database\Factories\AttributeFactory> */
    use HasFactory;

    /** @var list<string> */
    protected $fillable = [
        'name',
        'type',
    ];

    /** @return HasMany<AttributeValue, $this> */
    public function attributeValues(): HasMany
    {
        return $this->hasMany(AttributeValue::class);
    }
}
