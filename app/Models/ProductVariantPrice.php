<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductVariantPrice extends Model
{
    protected $guarded = ['id'];
    public function product()
    {
        $this->belongsTo(Product::class);
    }
    public function getVariant1Attribute()
    {
        return $this->product_variant_one ? VariantDetail::find($this->product_variant_one)->title : null;
    }
    public function getVariant2Attribute()
    {
        return $this->product_variant_two ? VariantDetail::find($this->product_variant_two)->title : null;
    }
    public function getVariant3Attribute()
    {
        return $this->product_variant_three ? VariantDetail::find($this->product_variant_three)->title : null;
    }
}
