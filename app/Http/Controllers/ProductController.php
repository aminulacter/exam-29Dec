<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductVariant;
use App\Models\ProductVariantPrice;
use App\Models\Variant;
use App\Models\VariantDetail;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;

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
        $products = $query->filter()
            ->with(['prices' => function ($query) {
                $query->when(request()->has('price_from'), function ($q) {
                    if (is_null(request('price_from')) || is_null(request("price_to"))) {
                        return $q;
                    }

                    return $q->whereBetween('price', [request('price_from'), request("price_to")]);
                });
                $query->when(request()->has('variant') && !is_null(request('variant')), function ($q) {
                    $secquence = VariantDetail::where('title', request('variant'))->first()->id;
                    return $q->where(function ($query) use ($secquence) {
                        $query->where('product_variant_one', $secquence)
                            ->orWhere('product_variant_two', $secquence)
                            ->orWhere('product_variant_three', $secquence);
                    });
                });
            }])
            ->paginate(2);

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
        //$variants = Variant::with('options')->get();
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

        //save $product
        $product = Product::create([
            'title' => request('title'),
            'sku' => request('sku'),
            'description' => request('description'),
        ]);

        //save Image
        $images = request('product_image');
        foreach ($images as $image) {
            $newlocation = "image/" . collect(explode('/', $image))->last();
            //$file = Storage::get($image);
            if (Storage::exists($newlocation)) {
                Storage::delete($newlocation);
            }
            Storage::move($image, $newlocation);
            $product->images()->create(['file_path' => $newlocation]);
        }

        //save new Variant Details
        $variantCollection = collect();
        foreach ($request->product_variant as $variant) {
            $variantCollection->put($variant['option'], $variant['tags']);
        }
        $variantCollection = $variantCollection->sortKeys();


        $variantCollection->map(function ($categories, $key) use ($product) {
            $allCategory = VariantDetail::all()->pluck('title');
            collect($categories)->map(function ($category) use ($key, $allCategory, $product) {
                if (!$allCategory->contains($category)) {
                    VariantDetail::create([
                        'title' => $category,
                        'variant_id' => $key
                    ]);
                }
                ProductVariant::create([
                    'variant' => $category,
                    'variant_id' => $key,
                    'product_id' => $product->id
                ]);
            });
        });


        //product prices
        $product_prices = collect($request->product_variant_prices)->map(function ($product_price) use ($product) {
            $variants = collect(explode('/', $product_price['title']))->filter()->map(function ($title) {
                try {
                    return VariantDetail::where('title', trim($title))->first()->id;
                } catch (Exception $e) {
                }
                return null;
            });

            $product->prices()->create([
                'product_variant_one' => isset($variants[0]) ? $variants[0] : null,
                'product_variant_two' => isset($variants[1]) ? $variants[1] : null,
                'product_variant_three' => isset($variants[2]) ? $variants[2] : null,
                'price' => $product_price['price'],
                'stock' => $product_price['stock']
            ]);
        });

        $status = "saved in database";
        return $status;
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

        return view('products.edit', compact('variants', 'product'));
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
