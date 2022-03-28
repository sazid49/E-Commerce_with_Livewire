<div>
  <style>
    nav svg{
      height: 20px;
    }
    nav .hidden{
      display: block !important;
    }
  </style>
<div class="container" style="padding:30px 0px">
  <div class="row">
   <div class="col-md-12">
     <div class="panel panel-default">
       <div class="panel-heading">
            ALL Order  
       </div>
       <div class="panel-body">
           @if (Session::has('order_message'))
              <div class="alert alert-success" role="alert">
                {{ Session::get('order_message') }}
              </div>
           @endif
           <table class="table table-striped">
            <thead>
              <tr>
                <td>Order Id</td>
                <td>Subtotal</td>
                <td>Discount</td>
                <td>Tax</td>
                <td>Total</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Modile</td>
                <td>Email</td>
                <td>Zipcode</td>
                <td>Status</td>
                <td>Order Date</td>
                <td olspan="2" style="text-align: center">Action</td>

              </tr>
            </thead>
            <tbody>
             @foreach ($orders as $order)
                 <tr>
                   <td>{{ $order->id }}</td>
                   <td>$ {{ $order->subtotal }}</td>
                   <td>$ {{ $order->discount }}</td>
                   <td>$ {{ $order->tax }}</td>
                   <td>$ {{ $order->total }}</td>
                   <td>{{ $order->firstname }}</td>
                   <td>{{ $order->lastname }}</td>
                   <td>{{ $order->mobile }}</td>
                   <td>{{ $order->email }}</td>
                   <td>{{ $order->zipcode }}</td>
                   <td>{{ $order->status }}</td>
                   <td>{{ $order->created_at }}</td>
                   <td>
                    <a href="{{ route('admin.orderdetails',['order_id'=>$order->id]) }}"><i class="btn btn-info btn-sm">Details</i></a>
                    {{-- <a href="#"  style="margin-left:10px;">
                      <i class="fa fa-times fa-2x text-danger" ></i>
                    </a> --}}
                   </td>
                   <td>
                    <div class="dropdown">
                      <button class="btn btn-success btn-sm dropdown-toggle" type="button" data-toggle="dropdown">Status
                        <span class="caret"></span>
                      </button>
                        <ul class="dropdown-menu">
                          <li><a href="#" wire:click.prevent="updateOrderStatus({{$order->id}},'delivered')">Delivered</a></li>
                          <li><a href="#" wire:click.prevent="updateOrderStatus({{$order->id}},'canceled')">Canceled</a></li>
                        </ul>
                    </div>
                    </td>
                 </tr>
              @endforeach
            </tbody>
         </table>
          {{ $orders->links()}}
       </div>
     </div>
   </div>
  </div>
</div>
</div>
