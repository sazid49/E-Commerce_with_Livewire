<div>
  <div class="container" style="padding:30px 0px">
    <div class="row">
     <div class="col-md-12">
       <div class="panel panel-default">
         <div class="panel-heading">
          <div class="row">
            <div class="col-md-6">
              Add New Slide
            </div>
            <div class="col-md-6">
             <a href="{{ route('admin.slider') }}" class="btn btn-success pull-right">All Slide</a>
            </div>
          </div>
         </div>
         <div class="panel-body">
           @if (Session::has('message'))
             <div class="alert alert-success" role="alert">
               {{ Session::get('message') }}
             </div>
           @endif

            <form class="form-horizontal"  wire:submit.prevent= "updateSlide">
               <div class="form-group">
                 <label class="col-md-4 control-lebel">Title</label>
                 <div class="col-md-4">
                  <input type="text" placeholder="Title" class="form-control input-md" wire:model="title">
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-md-4 control-lebel">Subtitle</label>
                 <div class="col-md-4">
                  <input type="text" placeholder="Subtitle" class="form-control input-md" wire:model="subtitle">
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-md-4 control-lebel">Price</label>
                 <div class="col-md-4">
                  <input type="text" placeholder="Price" class="form-control input-md" wire:model="price">
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-md-4 control-lebel">Link</label>
                 <div class="col-md-4">
                  <input type="text" placeholder="Link" class="form-control input-md" wire:model="link">
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-md-4 control-lebel">Image</label>
                 <div class="col-md-4">
                  <input type="file"  class="input-file" wire:model="newimage">
                  {{-- @if ($image)
                     <img src="{{ $image->temporaryUrl() }}" width="120">
                  @endif --}}

                  @if ($newimage)
                    <img src="{{ $newimage->temporaryUrl()}}" width="120">
                    @else
                      <img src="{{ asset('assets\images\sliders')}}/{{ $image }}" width="120" >
                  @endif
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-md-4 control-lebel">Status</label>
                 <div class="col-md-4">
                  <select class="form-control" wire:model="status">
                    <option value="0">Inactive</option>
                    <option value="1">Active</option>
                  </select>
                 </div>
               </div>

               <div class="form-group">
                 <label class="col-md-4 control-lebel"></label>
                 <div class="col-md-4">
                  <button type="submit" class="btn btn-success" >Update</button>
                 </div>
               </div>

            </form>
         </div>
       </div>
     </div>
    </div>
  </div>
</div>
