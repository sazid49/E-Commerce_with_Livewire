<div class="">
  <style>
    nav svg{
      height: 20px;
    }
    nav .hidden{
      display: block !important;
    }
  </style>
  <div class="container" style="padding:30px 0;">
    <div class="row">
     <div class="col-md-12">
       <div class="panel panel-default">
        <div class="panel-heading">
          <div class="row">
           <div class="col-md-6">
             All Products
           </div>
           <div class="col-md-6">
             <a href="{{route('admin.addproduct')}}" class="btn btn-success pull-right">Add New Product</a>
           </div>
          </div>
        </div>
        <div class="panel-body">
          @if (Session::has('message'))
            <div class="alert alert-success" role="alert">
              {{ Session::get('message') }}
            </div>
          @endif
           <table class="table table-striped">
              <thead>
                <tr>
                  <td>Id</td>
                  <td>Image</td>
                  <td>Name</td>
                  <td>Stock</td>
                  <td>Price</td>
                  <td>Sale Price</td>
                  <td>Category</td>
                  <td>Sub Category</td>
                  <td>Date</td>
                  <td>Action</td>
                </tr>
              </thead>
              <tbody>
                @foreach ($products as  $product)
                   <tr>
                     <td>{{ $product->id }}</td>
                     <td> <img src="{{asset('assets/images/products')}}/{{ $product->image }}" width="60" ></td>
                     <td>{{ $product->name }}</td>
                     <td>{{ $product->stock_status }}</td>
                     <td>{{ $product->regular_price }}</td>
                     <td>{{ $product->sale_price }}</td>
                     <td>{{ $product->category->name }}</td>
                     @if ($product->subCategories)
                       <td>{{ $product->subCategories->name }}</td>
                       @else
                         <td>No Set</td>
                     @endif
                     <td>{{ $product->created_at }}</td>
                     <td>

                      <a href="{{ route('admin.editproduct',['product_slug'=>$product->slug])}}"><i class="fa fa-edit fa-2x text-info"></i></a>
                      <a href="#"  onclick=" confirm('Are you sure, You want to delete this product?') || event.stopImmediatePropagation()"  wire:click.prevent="deleteProduct({{ $product->id }})" style="margin-left:10px;"> <i class="fa fa-times fa-2x text-danger" ></i></a>

                     </td>
                   </tr>
                @endforeach
              </tbody>
           </table>
           {{ $products->links() }}
        </div>
       </div>
     </div>
    </div>
  </div>
</div>
