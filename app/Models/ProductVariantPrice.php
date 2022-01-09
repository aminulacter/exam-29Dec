<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductVariantPrice extends Model
{
    public function product()
    {
        $this->belongsTo(Product::class);
    }
    public function getVariant1Attribute()
    {
        return $this->product_variant_one ? ProductVariant::find($this->product_variant_one)->variant : null;
    }
    public function getVariant2Attribute()
    {
        return $this->product_variant_two ? ProductVariant::find($this->product_variant_two)->variant : null;
    }
    public function getVariant3Attribute()
    {
        return $this->product_variant_three ? ProductVariant::find($this->product_variant_three)->variant : null;
    }
}
