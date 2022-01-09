<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VariantDetail extends Model
{
    protected $fillable = [
        'title', 'variant_id', 'crated_at', 'deleted_at'
    ];

    public function variant()
    {
        return $this->belongsTo(Variant::class);
    }
}
