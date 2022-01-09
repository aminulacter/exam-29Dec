<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
    protected $fillable = [
        'title', 'sku', 'description'
    ];

    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }
    public function variants()
    {
        return $this->belongsToMany(Variant::class, 'product_variants')->withPivot('variant')->withTimestamps();
    }

    public function prices()
    {
        return $this->hasMany(ProductVariantPrice::class);
    }


    public function scopeFilter($query)
    {
        $query->when(request()->has('title'), function ($q) {
            if (is_null(request('title'))) {
                return $q;
            }
            return $q->where('title', 'like', "%" . request('title') . "%");
        })
            ->when(request()->has('variant'), function ($q) {
                $variant = request('variant');
                if (is_null($variant)) {
                    return $q;
                }
                //return $q->variant(request("variant"));
                return $q->whereIn('id', DB::table('products')
                    ->join('product_variants', 'products.id', 'product_variants.product_id')
                    ->where('variant', $variant)->select('products.id'));
            })
            ->when(request()->has('price_from'), function ($q) {
                if (is_null(request('price_from')) || is_null(request("price_to"))) {
                    return $q;
                }
                // return $q->pricerange(request("price_from"), request("price_to"));
                return $q->whereIn(
                    'id',
                    DB::table('products')
                        ->join('product_variant_prices', 'products.id', 'product_variant_prices.product_id')
                        ->whereBetween('price', [request("price_from"), request("price_to")])->select('products.id')
                );
            })
            ->when(request()->has('date'), function ($q) {
                if (is_null(request('date'))) {
                    return $q;
                }
                // return $q->datecheck(request("date"));
                return $q->whereDate('created_at', request("date"));
            });
    }
}
