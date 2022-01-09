@extends('layouts.app')

@section('content')

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Products</h1>
</div>


<div class="card">
    <form action="{{ route('product.index') }}" method="get" class="card-header" id="submitFilter"
        onsubmit="chekInput(event)">
        <div class="form-row justify-content-between">
            <div class="col-md-2">
                <input type="text" name="title" id="title" placeholder="Product Title" class="form-control"
                    value="{{ $filter->has('title')? $filter['title'] : '' }}">
            </div>
            <div class="col-md-2">
                <select name="variant" class="form-control" id="variant">
                    @foreach ($variants as $variant )
                    <option value="{{ $variant->title }}" disabled style="font-size: 20px">
                        {{$variant->title}}</option>
                    @foreach ($variant->options as $option)
                    <option value="{{ $option->title }}" {{ $filter->has('variant') && $filter['variant'] ==
                        $option->title?
                        'selected' : ''}}
                        >{{$option->title}}</option>
                    @endforeach

                    @endforeach

                </select>
            </div>

            <div class="col-md-3">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Price Range</span>
                    </div>

                    <input type="text" name="price_from" aria-label="First name" id="price_from" placeholder="From"
                        class="form-control" value="{{$filter->has('price_from')? $filter['price_from']: '' }}">
                    <input type="text" name="price_to" aria-label="Last name" id="price_to" placeholder="To"
                        value="{{$filter->has('price_to')? $filter['price_to'] : '' }}" class="form-control">
                </div>
            </div>
            <div class="col-md-2">
                <input type="date" name="date" placeholder="Date"
                    value="{{ $filter->has('date')? $filter['date'] : '' }}" class="form-control" id="date">
            </div>
            <div class="col-md-1">
                <button type="submit" class="btn btn-primary float-right"><i class="fa fa-search"></i></button>
            </div>
        </div>
    </form>

    <div class="card-body">
        <div class="table-response">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Variant</th>
                        <th width="150px">Action</th>
                    </tr>
                </thead>
                @foreach ($products as $product)


                <tbody>

                    <tr>
                        <td style="width: 5%">{{$loop->iteration}}</td>
                        <td class="ml-0 pl-0" style="width: 5%">{{ $product->title }} <br> Created at :
                            {{$product->created_at->diffForHumans()}}</td>
                        <td class="ml-0 pl-0" class="ml-0 pl-0" style="width: 50%">{{ $product->description }}</td>
                        <td style="width: 40%">
                            <dl class=" row mb-0" style="height: 80px; overflow: hidden;  id=variant">
                                @foreach($product->prices as $price)
                                <dt class="col-sm-3 pb-0">
                                    {{ $price->variant1? "$price->variant1/":"" }}
                                    {{ $price->variant2? "$price->variant2/": "" }}
                                    {{ $price->variant3 }}
                                </dt>

                                <dd class="col-sm-9">
                                    <dl class="row mb-0">
                                        <dt class="col-sm-6 pb-0">Price : {{
                                            number_format($price->price,2) }}</dt>
                                        <dd class="col-sm-6 pb-0">InStock : {{
                                            number_format($price->stock,2) }}</dd>
                                    </dl>
                                </dd>
                                @endforeach
                            </dl>
                            <button onclick="$('#variant').toggleClass('h-auto')" class="btn btn-sm btn-link mt-3">Show
                                more</button>
                        </td>
                        <td style="width:5%">
                            <div class="btn-group btn-group-sm">
                                <a href="{{ route('product.edit', 1) }}" class="btn btn-success">Edit</a>
                            </div>
                        </td>
                    </tr>

                </tbody>
                @endforeach
            </table>
        </div>

    </div>

    <div class="card-footer">
        <div class="row justify-content-between">
            <div class="col-md-6">
                <p>Showing {{$products->firstItem()}} to {{$products->lastItem()}} out of {{$products->total()}}
                </p>
            </div>
            <div class="col-md-4">
                {{$products->withQueryString()->links()}}
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
    var submit = false;
    function chekInput(event)
    {
           event.preventDefault()
            //submit = true;
            let title = "";
            let query=""

            if(document.getElementById('title').value !="")
            {
                query =  "?" + "title="+ document.getElementById('title').value
            }
            if(document.getElementById('variant').value !="")
            {
            variant = document.getElementById('variant').value
                if(query.length)
                {
                    query = query + "&" + "variant=" + variant

                }
                else{
                    query = "?" + "variant=" + variant
                }
            }
             if(document.getElementById('price_from').value !="")
             {
            price_from = document.getElementById('price_from').value
                if(query.length)
                {
                query = query + "&" + "price_from=" + price_from

                }
                else{
                query = "?" + "price_from=" + price_from
                }
            }
            if(document.getElementById('price_to').value !="")
            {
                price_to = document.getElementById('price_to').value
                if(query.length)
                {
                query = query + "&" + "price_to=" + price_to

                }
                else{
                query = "?" + "price_to=" + price_to
                }
            }
            if(document.getElementById('date').value !="")
            {
                date = document.getElementById('date').value
                if(query.length)
                {
                query = query + "&" + "date=" + date

                }
                else{
                query = "?" + "date=" + date
                }
            }
            // if(document.getElementById('title').value !="")
            // {
            // title = document.getElementById('title').value
            // }
            let location = "{{ route('product.index') }}"
            if(query.length){
                location = location + query
            }
            console.log(location);
            //document.getElementById('submitFilter').submit()
            window.location.href = location



    }
</script>
@endpush
