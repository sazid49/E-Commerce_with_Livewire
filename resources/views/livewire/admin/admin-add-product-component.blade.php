
  <div class="container" style="padding:30px 0;">
    <div class="row">
     <div class="col-md-12">
      <div class="panel panel-default">
       <div class="panel-heading">
         <div class="row">
           <div class="col-md-6">
            Add New Product
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
          <form class="form-horizontal" wire:submit.prevent="addProduct" enctype="multipart/form-data">

             <div class="form-group">
               <label class="col-md-4 control-label">Product Name</label>
               <div class="col-md-4">
                <input type="text" wire:model="name" class="form-control input-md" placeholder="Product name" wire:keyup="generateSlug">
                @error ('name')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Product Slug</label>
               <div class="col-md-4">
                <input type="text" wire:model="slug"   class="form-control input-md" placeholder="Product slug">
                @error ('slug')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Short Description</label>
               <div class="col-md-4" wire:ignore>
                <textarea class="form-control" id="short_description" placeholder="Short Description" wire:model="short_description"></textarea>
                @error ('short_description')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Description</label>
               <div class="col-md-4" wire:ignore>
                <textarea class="form-control" id="description" placeholder="Description" wire:model="description"></textarea>
                @error ('description')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Regular Price</label>
               <div class="col-md-4">
                <input type="text" wire:model="regular_price" class="form-control input-md" placeholder="Regular Price">
                @error ('regular_price')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>



             <div class="form-group">
               <label class="col-md-4 control-label">Sale Price</label>
               <div class="col-md-4">
                <input type="text" wire:model="sale_price" class="form-control input-md" placeholder="Sale Price">
                @error ('sale_price')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">SKU</label>
               <div class="col-md-4">
                <input type="text" wire:model="SKU" class="form-control input-md" placeholder="SKU">
                @error ('SKU')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Stock</label>
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
               <label class="col-md-4 control-label">Featured</label>
               <div class="col-md-4">
                <select class="form-control" wire:model="featured">
                  <option value="0">No</option>
                  <option value="1">Yes</option>
                </select>
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Quantity</label>
               <div class="col-md-4">
                <input type="text" wire:model="quantity" class="form-control input-md" placeholder="Quantity">
                @error ('quantity')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>

             <div class="form-group">
               <label class="col-md-4 control-label">Product Image</label>
               <div class="col-md-4">
                <input type="file" wire:model="image" class="input-file" >
                @if ($image)
                  <img src="{{ $image->temporaryUrl()}}" width="120">
                @endif
                @error ('image')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>


             <div class="form-group">
               <label class="col-md-4 control-label">Product Gallery </label>
               <div class="col-md-4">
                <input type="file" wire:model="images" class="input-file" multiple >
                @if ($images)
                  @foreach ($images as  $image)
                    <img src="{{ $image->temporaryUrl()}}" width="120">
                  @endforeach
                @endif
                @error ('images')
                 <p class="text-danger">{{ $message }}</p>
                @enderror
               </div>
             </div>


             <div class="form-group">
               <label class="col-md-4 control-label">Category</label>
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
               <label class="col-md-4 control-label">Sub Category</label>
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
               <label class="col-md-4 control-label"></label>
               <div class="col-md-4">
                <button type="submit"  class="btn btn-primary">Submit</button>
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
