<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AttributeValue extends Model
{
    /** @use HasFactory<\Database\Factories\AttributeValueFactory> */
    use HasFactory;

    /** @var list<string> */
    protected $fillable = [
        'attribute_id',
        'entity_id',
        'value',
    ];

    /** @return BelongsTo<Attribute, $this> */
    public function attribute(): BelongsTo
    {
        return $this->belongsTo(Attribute::class);
    }

    /** @return BelongsTo<Project, $this> */
    public function entity(): BelongsTo
    {
        return $this->belongsTo(Project::class, 'entity_id');
    }
}
