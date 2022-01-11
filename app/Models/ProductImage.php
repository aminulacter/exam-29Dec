<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    protected $guarded = ['id'];
    public function product()
    {
        $this->belongsTo(Product::class);
    }
}
