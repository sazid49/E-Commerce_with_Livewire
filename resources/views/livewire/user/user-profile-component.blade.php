<div>
     <div class="container" style="padding:30px 0;">
       <div class="row">
         <div class="panel panel-default">
          <div class="panel-heading">
            <h3>Profile</h3>
          </div>
          <div class="panel-body">
            <div class="col-md-4">
              @if ($user->profile->image)
                 <img src="{{ asset('assets/images/profile')}}/{{$user->image}}" width="100%" alt="">
                 @else
                   <img src="{{ asset('assets/images/profile/images.jpg')}}" width="100%" alt="">
              @endif
            </div>
            <div class="col-md-8">
               <p> <b>Name: </b>{{ $user->name }}</p>
               <p> <b>Email: </b>{{ $user->email }}</p>
               <p> <b>Phone: </b>{{ $user->profile->mobile }}</p>
               <hr>
               <p> <b>line1: </b>{{ $user->profile->line1 }}</p>
               <p> <b>line2: </b>{{ $user->profile->line2 }}</p>
               <p> <b>City: </b>{{ $user->profile->city }}</p>
               <p> <b>Province: </b>{{ $user->profile->province }}</p>
               <p> <b>Country: </b>{{ $user->profile->Country }}</p>
               <p> <b>Zipcode: </b>{{ $user->profile->zipcode }}</p>
            </div>
          </div>
         </div>
       </div>
     </div>
</div>
