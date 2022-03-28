<div>
  <div class="container" style="padding:30px 0px">
<div class="row">
 <div class="col-md-12">
   <div class="panel panel-default">
     <div class="panel-heading">
      <div class="row">
        <div class="col-md-6">
          ALL Brand
        </div>
        <div class="col-md-6">
         <a href="{{ route('admin.addbrand') }} " class="btn btn-success pull-right">Add Brand</a>
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
              <td>Name</td>
              <td>Slug</td>
              <td>Action</td>
            </tr>
          </thead>
          <tbody>
              @foreach ($brands as  $brand)
               <tr>
                 <td>{{ $brand->id }}</td>
                 <td>{{ $brand->name }}</td>
                 <td>{{ $brand->slug }}</td>
                 <td>
                  <a href="{{ route('admin.editbrand',['brand_slug'=>$brand->slug]) }}"><i class="fa fa-edit fa-2x text-info"></i></a>
                  <a href="#" onclick=" confirm('Are you sure, You want to delete this brand?') || event.stopImmediatePropagation()"   wire:click.prevent="deleteBrand({{ $brand->id }})"  style="margin-left:10px;">
                    <i class="fa fa-times fa-2x text-danger" ></i>
                  </a>
                 </td>
               </tr>
              @endforeach
          </tbody>
       </table>

     </div>
   </div>
 </div>
</div>
</div>
</div>
