
  <div class="container" style="padding:30px 0;">
    <div class="row">
     <div class="col-md-12">
      <div class="panel panel-default">
       <div class="panel-heading">
         <div class="row">
           <div class="col-md-6">
            Edit Product
           </div>
           <div class="col-md-6">
            <a href="{{ route('admin.products') }}" class="btn btn-success pull-right">All Products</a>
           </div>
         </div>
       </div>
       <div class="panel-body">
         @if (Session::has('message'))
           <div class="alert alert-success" role="alert">
             {{ Session::get('message') }}
           </div>
         @endif
          <form class="form-horizontal" wire:submit.prevent="updateProduct" enctype="multipart/form-data">


             <div class="form-group">
               <label class="col-md-4 control-lebel">Product Name</label>
               <div class="col-md-4">
                <input type="text" wire:model="name" class="form-control input-md" placeholder="Product name" wire:keyup="generateSlug">
                @error ('name')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Product Slug</label>
               <div class="col-md-4">
                <input type="text" wire:model="slug"   class="form-control input-md" placeholder="Product slug">
                @error ('slug')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Short Description</label>
               <div class="col-md-4" wire:ignore>
                <textarea class="form-control" id="short_description" placeholder="Short Description" wire:model="short_description"></textarea>
                @error ('short_description')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Description</label>
               <div class="col-md-4" wire:ignore>
                <textarea class="form-control" id="description" placeholder="Description" wire:model="description"></textarea>
                @error ('description')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Regular Price</label>
               <div class="col-md-4">
                <input type="text" wire:model="regular_price" class="form-control input-md" placeholder="Regular Price">
                @error ('regular_price')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Sale Price</label>
               <div class="col-md-4">
                <input type="text" wire:model="sale_price" class="form-control input-md" placeholder="Sale Price">
                @error ('sale_price')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">SKU</label>
               <div class="col-md-4">
                <input type="text" wire:model="SKU" class="form-control input-md" placeholder="SKU">
                @error ('SKU')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Stock</label>
               <div class="col-md-4">
                <select class="form-control" wire:model="stock_status">
                  <option value="instock">InStock</option>
                  <option value="outofstock">Out Of Stock</option>
                </select>
                @error ('stock_status')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Featured</label>
               <div class="col-md-4">
                <select class="form-control" wire:model="featured">
                  <option value="0">No</option>
                  <option value="1">Yes</option>
                </select>
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Quantity</label>
               <div class="col-md-4">
                <input type="text" wire:model="quantity" class="form-control input-md" placeholder="Quantity">
                @error ('quantity')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Product Image</label>
               <div class="col-md-4">
                <input type="file" wire:model="newimage" class="input-file" >
                @if ($newimage)
                  <img src="{{ $newimage->temporaryUrl()}}" width="120">
                  @else
                    <img src="{{ asset('assets\images\products')}}/{{ $image }}" width="120" >
                @endif
                @error ('newimage')<p class="text-danger">{{ $message }}</p>@enderror
               </div>
             </div>


             <div class="form-group">
                <label class="col-md-4 control-label">Product Gallery</label>
                <div class="col-md-4">
                 <input type="file" class="input-file" wire:model="newimages" multiple />
                 @if($newimages)
                   @foreach($newimages as $newimage)
                     @if($newimage)
                       <img src="{{$newimage->temporaryUrl()}}" width="120" />
                     @endif
                   @endforeach
                 @else
                   @foreach($images as $image)
                     @if($image)
                       <img src="{{asset('assets/images/products')}}/{{$image}}" width="120" />
                     @endif
                   @endforeach
                 @endif
                </div>
                </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Category</label>
               <div class="col-md-4">
                 <select class="form-control" wire:model="category_id" wire:change="changeSubcategory">
                   <option>Select Category</option>
                   @foreach ($categoris as  $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                   @endforeach
                 </select>
                 @error ('category_id')
                  <p class="text-danger">{{ $message }}</p>
                 @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-lebel">Sub Category</label>
               <div class="col-md-4">
                 <select class="form-control" wire:model="scategory_id">
                   <option value="0">Select Category</option>
                   @foreach ($scategoris as  $scategory)
                    <option value="{{ $scategory->id }}">{{ $scategory->name }}</option>
                   @endforeach
                 </select>
                 @error ('scategory_id')
                  <p class="text-danger">{{ $message }}</p>
                 @enderror
               </div>
             </div>



             <div class="form-group">
               <label class="col-md-4 control-lebel"></label>
               <div class="col-md-4">
                <button type="submit"  class="btn btn-primary">Update</button>
               </div>
             </div>
          </form>
       </div>
      </div>
     </div>
    </div>
  </div>
</div>

@push('scripts')
<script>

$(function() {
    tinymce.init({
      selector:'#short_description',
      setup : function(editor){
        editor.on('Change',function(e){
          tinyMCE.triggerSave();
          var sd_data = $('#short_description').val();
          @this.set('short_description',sd_data);
        });
      }
    });

    tinymce.init({
      selector:'#description',
      setup : function(editor){
        editor.on('Change',function(e){
          tinyMCE.triggerSave();
          var d_data = $('#description').val();
          @this.set('description',d_data);
        });
      }
    });

   });

</script>
@endpush
