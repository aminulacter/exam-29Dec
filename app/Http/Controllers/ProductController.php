<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use App\Models\Variant;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function index()
    {

        $query = Product::query();
        // $query->when(request()->has('title'), function ($q) {
        //     if (is_null(request('title'))) {
        //         return $q;
        //     }
        //     return $q->filter(request('title'));
        // })
        //     ->when(request()->has('variant'), function ($q) {
        //         if (is_null(request('variant'))) {
        //             return $q;
        //         }
        //         return $q->variant(request("variant"));
        //     })
        //     ->when(request()->has('price_from'), function ($q) {
        //         if (is_null(request('price_from'))) {
        //             return $q;
        //         }
        //         return $q->pricerange(request("price_from"), request("price_to"));
        //     })
        //     ->when(request()->has('date'), function ($q) {
        //         if (is_null(request('date'))) {
        //             return $q;
        //         }
        //         return $q->datecheck(request("date"));
        //     });

        // $products = $query->with(['prices' =>
        // }])->paginate(2);



        $products = $query->filter()
            ->with(['prices' => function ($query) {
                $query->when(request()->has('price_from'), function ($q) {
                    if (is_null(request('price_from')) || is_null(request("price_to"))) {
                        return $q;
                    }

                    return $q->whereBetween('price', [request('price_from'), request("price_to")]);
                });
                $query->when(request()->has('variant') && !is_null(request('variant')), function ($q) {
                    $secquence = ProductVariant::where('variant', request('variant'))->first()->id;
                    return $q->where(function ($query) use ($secquence) {
                        $query->where('product_variant_one', $secquence)
                            ->orWhere('product_variant_two', $secquence)
                            ->orWhere('product_variant_three', $secquence);
                    });
                });
            }])
            ->paginate(2);
        dump($products);
        //dd($products);
        $filter = new Collection();
        if (request()->has('title') && !is_null(request('title'))) {
            $filter->put('title', request('title'));
        }
        if (request()->has('variant') && !is_null(request('variant'))) {
            $filter->put('variant', request('variant'));
        }
        if (request()->has('price_from') && !is_null(request('price_from'))) {
            $filter->put('price_from', request('price_from'));
        }
        if (request()->has('price_to') && !is_null(request('price_to'))) {
            $filter->put('price_to', request('price_to'));
        }
        if (request()->has('date') && !is_null(request('date'))) {
            $filter->put('date', request('date'));
        }
        dump($filter);

        $variants = Variant::with('options')->get();

        return view('products.index', [
            'products' => $products,
            'variants' => $variants,
            'filter' => $filter
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Http\Response|\Illuminate\View\View
     */
    public function create()
    {
        $variants = Variant::all();
        return view('products.create', compact('variants'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
    }


    /**
     * Display the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show($product)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        $variants = Variant::all();
        return view('products.edit', compact('variants'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }
}
