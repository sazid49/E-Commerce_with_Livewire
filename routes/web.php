<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\HomeComponent;
use App\Http\Livewire\ShopComponent;
use App\Http\Livewire\CartComponent;
use App\Http\Livewire\CheckoutComponent;
use App\Http\Livewire\DetailsComponent;
use App\Http\Livewire\CategoryComponent;
use App\Http\Livewire\SearchComponent;
use App\Http\Livewire\WishlistComponent;
use App\Http\Livewire\ThankyouComponent;
use App\Http\Livewire\ContactComponent;

           // User part Start
use App\Http\Livewire\User\UserDashboardComponent;


          //User Order part
use App\Http\Livewire\User\UserOrdersComponent;
use App\Http\Livewire\User\UserOrderDetailsComponent;


           //User Order Part
use App\Http\Livewire\User\UserReviewComponent;

           //User password Change
use App\Http\Livewire\User\UserChangePasswordComponent;
          //User Profile
use App\Http\Livewire\User\UserProfileComponent;



          // Admin part Start
use App\Http\Livewire\Admin\AdminDashboardComponent;

             // Admin homeCategory
use App\Http\Livewire\Admin\AdminHomeCategoryComponent;


              // Sale Timer
use App\Http\Livewire\Admin\AdminSaleComponent;

          // Admin category Part
use App\Http\Livewire\Admin\AdminCategoryComponent;
use App\Http\Livewire\Admin\AdminAddCategoryComponent;
use App\Http\Livewire\Admin\AdminEditCategoryComponent;
             // Admin Product Part
use App\Http\Livewire\Admin\AdminProductComponent;
use App\Http\Livewire\Admin\AdminAddProductComponent;
use App\Http\Livewire\Admin\AdminEditProductComponent;

            // Admin Slider Part
use App\Http\Livewire\Admin\AdminHomeSliderComponent;
use App\Http\Livewire\Admin\AdminAddHomeSliderComponent;
use App\Http\Livewire\Admin\AdminEditHomeSliderComponent;
           // Admin Coupon Part Start
use App\Http\Livewire\Admin\AdminCouponsComponent;
use App\Http\Livewire\Admin\AdminAddCouponComponent;
use App\Http\Livewire\Admin\AdminEditCouponComponent;

            // Admin Order part
use App\Http\Livewire\Admin\AdminOrderComponent;
use App\Http\Livewire\Admin\AdminOrderDetailsComponent;

            //Admin Contact
use App\Http\Livewire\Admin\AdminContactComponent;

            //Admin setting
use App\Http\Livewire\Admin\AdminSettinComponent;
            //Admin Brand
use App\Http\Livewire\Admin\AminBrandComponent;
use App\Http\Livewire\Admin\AminAddBrandComponent;
use App\Http\Livewire\Admin\AminEditBrandComponent;









/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get("/",HomeComponent::class);
Route::get("/shop",ShopComponent::class)->name('home.shop');
Route::get("/cart",CartComponent::class)->name('product.cart');
Route::get("/checkout",CheckoutComponent::class)->name('checkout');
Route::get("/product/{slug}",DetailsComponent::class)->name('product.details');
Route::get("/product-category/{category_slug}/{scategory_slug?}",CategoryComponent::class)->name('product.category');
Route::get("/search",SearchComponent::class)->name('product.search');
Route::get("/wishlist",WishlistComponent::class)->name('product.wishlist');
Route::get("/thankyou",ThankyouComponent::class)->name('thankyou');
Route::get("/contact-us",ContactComponent::class)->name('contact');



// Route::get('cd', function(){
//
//   $cc = session()->get('coupon');
//
//   // return session()->forget('coupon');
//   dd($cc);
// });


// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return view('dashboard');
// })->name('dashboard');

       // For User
   Route::middleware(['auth:sanctum', 'verified'])->group(function() {
   Route::get('/user/dashboard',UserDashboardComponent::class)->name('user.dashboard');
   Route::get('/user/orders',UserOrdersComponent::class)->name('user.orders');
   Route::get('/user/orders/{order_id}',UserOrderDetailsComponent::class)->name('user.orderdetails');
   Route::get('/user/review/{order_item_id}',UserReviewComponent::class)->name('user.review');
   Route::get('/user/change-password',UserChangePasswordComponent::class)->name('user.changepassword');
   Route::get('/user/profile',UserProfileComponent::class)->name('user.profile');
});

       // For Admin
  Route::middleware(['auth:sanctum', 'verified','authadmin'])->group(function() {
  Route::get('/admin/dashboard',AdminDashboardComponent::class)->name('admin.dashboard');
                        // Admin Category Part
  Route::get('/admin/categories',AdminCategoryComponent::class)->name('admin.categories');
  Route::get('/admin/categories/add',AdminAddCategoryComponent::class)->name('admin.addcategories');
  Route::get('/admin/category/edit/{category_slug}/{scategory_slug?}',AdminEditCategoryComponent::class)->name('admin.editcategory');
                           // Admin Product Part
  Route::get('/admin/products',AdminProductComponent::class)->name('admin.products');
  Route::get('/admin/product/add',AdminAddProductComponent::class)->name('admin.addproduct');
  Route::get('/admin/product/edit/{product_slug}',AdminEditProductComponent::class)->name('admin.editproduct');

                              // Admin Slider Part

  Route::get('/admin/slider',AdminHomeSliderComponent::class)->name('admin.slider');
  Route::get('/admin/slider/add',AdminAddHomeSliderComponent::class)->name('admin.addhomeslider');
  Route::get('/admin/slider/edit/{slide_id}',AdminEditHomeSliderComponent::class)->name('admin.edithomeslider');
  Route::get('/admin/home-categories',AdminHomeCategoryComponent::class)->name('admin.homecategories');
  Route::get('/admin/sale',AdminSaleComponent::class)->name('admin.sale');

                               // Admin Coupons Part
  Route::get('/admin/coupons',AdminCouponsComponent::class)->name('admin.coupons');
  Route::get('/admin/coupon/add',AdminAddCouponComponent::class)->name('admin.addcoupon');
  Route::get('/admin/coupon/edit/{coupon_id}',AdminEditCouponComponent::class)->name('admin.editcoupon');

                                // Admin Order Part
  Route::get('/admin/orders',AdminOrderComponent::class)->name('admin.orders');
  Route::get('/admin/orders/{order_id}',AdminOrderDetailsComponent::class)->name('admin.orderdetails');

                                  // Admin ContactComponent
  Route::get('/admin/contact-us',AdminContactComponent::class)->name('admin.contact');

                                  // Admin Setting
  Route::get('/admin/settings',AdminSettinComponent::class)->name('admin.settings');
                                  //Admin Brand
  Route::get('/admin/brands',AminBrandComponent::class)->name('admin.brands');
  Route::get('/admin/brand/add',AminAddBrandComponent::class)->name('admin.addbrand');
  Route::get('/admin/brand/edit/{brand_slug}',AminEditBrandComponent::class)->name('admin.editbrand');

});
