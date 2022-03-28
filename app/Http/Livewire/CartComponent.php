<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Cart;
use App\Models\Coupon;
use Session;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;



class CartComponent extends Component
{


  public $haveCouponCode;
  public $couponCode;
  public $discount;
  public $subtotalAfterDiscount;
  public $taxAfterDiscount;
  public $totalAfterDiscount;


    public function mount()
    {
      // dd(Cart::instance('cart')->subtotal());
    }


    public function increaseQuantity($rowId)
    {
      $product = Cart::instance('cart')->get($rowId);
      $qty = $product->qty +1 ;
      Cart::instance('cart')->update($rowId, $qty);
      $this->emitTo('cart-count-component','refreshComponent');

    }

    public function decreaseQuantity($rowId)
    {
      $product = Cart::instance('cart')->get($rowId);
      $qty = $product->qty - 1 ;
      Cart::instance('cart')->update($rowId, $qty);
      $this->emitTo('cart-count-component','refreshComponent');

    }

    public function destroy($rowId)
    {
      Cart::instance('cart')->remove($rowId);
      $this->emitTo('cart-count-component','refreshComponent');
      session()->flash('success_message','Item has been remove');

    }

    public function destroyAll()
    {
      Cart::instance('cart')->destroy();
      $this->emitTo('cart-count-component','refreshComponent');

    }

    public function swithToSaveForLater($rowId)
    {
      $item = Cart::instance('cart')->get($rowId);
      Cart::instance('cart')->remove($rowId);
      Cart::instance('saveForLater')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
      $this->emitTo('cart-count-component','refreshComponent');
      session()->flash('success_message','Item has move save for later');
    }

    public function moveToCart($rowId)
    {
      $item = Cart::instance('saveForLater')->get($rowId);
      Cart::instance('saveForLater')->remove($rowId);
      Cart::instance('cart')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');
      $this->emitTo('cart-count-component','refreshComponent');
      session()->flash('s_success_message','Item has been moved to cart');
    }

    public function deleteFromSaveForLater($rowId)
    {
      Cart::instance('saveForLater')->remove($rowId);
      session()->flash('s_success_message','Item has been delete from save for later');

    }

    public function applyCouponCode()
  {
      $total = Cart::instance('cart')->subtotal();
      // $num = str_replace(",", "", $total);
      // dd($num);
  	  $coupon = Coupon::where('code',$this->couponCode)
                      ->where('expiry_date','>=',Carbon::today())
                      ->where('cart_value', '<=', $total)
                      ->first();
    // dd($coupon);
  	if(!$coupon)
  	{
  		session()->flash('coupon_message','Coupon code is invalid!');
  		return;
  	}
  	session()->put('coupon',[
  		'code' => $coupon->code,
  		'type' => $coupon->type,
  		'value' => $coupon->value,
  		'cart_value' => $coupon->cart_value
  	]);

  }

  public function calculateDiscounts()
  {
  	if(session()->has('coupon'))
  	{
      $ff = Cart::instance('cart')->subtotal();
      $nn = str_replace(',','', $ff);
  		if(session()->get('coupon')['type'] == 'fixed')
  		{
  			$this->discount = session()->get('coupon')['value']; //333
        $this->subtotalAfterDiscount = $nn - $this->discount;
        $this->taxAfterDiscount = ($nn * 10)/100;
        $this->totalAfterDiscount = $this->subtotalAfterDiscount + $this->taxAfterDiscount;
  		}
  		else
  		{
        $this->discount = session()->get('coupon')['value']; //5
  			$this->subtotalAfterDiscount = ($nn * session()->get('coupon')['value'])/100;
        $total = $nn - $this->subtotalAfterDiscount;
        $this->taxAfterDiscount = ($nn * 10)/100;
        $this->totalAfterDiscount = $total + $this->taxAfterDiscount;
  		}

      // if (is_numeric(Cart::instance('cart')->subtotal())) {
      // }else{
      //
      //   // dd($nn);
      //   // dd('number na');
      // }


      //
  		// $this->taxAfterDiscount = ($this->subtotalAfterDiscount * 10)/100;
  		// $this->totalAfterDiscount = $this->subtotalAfterDiscount + $this->taxAfterDiscount;
  	}
  }

  public function removeCoupon()
  {
  	session()->forget('coupon');
  }

  public function checkout()
   {
     if (Auth::check()) {
        return redirect()->route('checkout');
     }else {
       return redirect()->route('login');
     }
   }

   public function setAmountAfterCheckout()
   {
     if (!Cart::instance('cart')> 0) {
         session::forget('checkout');
         return;
     }
     if(session()->has('coupon'))
   	{
   		session()->put('checkout',[
   			'discount' => $this->discount,
   			'subtotal' => $this->subtotalAfterDiscount,
   			'tax' => $this->taxAfterDiscount,
   			'total' => $this->totalAfterDiscount
   		]);
   	}
   	else
   	{
   		session()->put('checkout',[
   			'discount' => 0,
   			'subtotal' => Cart::instance('cart')->subtotal(),
   			'tax' => Cart::instance('cart')->tax(),
   			'total' => Cart::instance('cart')->total()
   		]);
   	}
   }

    public function render()
    {
      // $ff = Cart::instance('cart')->subtotal();
      // $nn = str_replace(',','', $ff);
      // dd(gettype($nn));
      // $gs = session()->get('coupon')['cart_value'];
      // dd(gettype($gs));

        if (session()->has('coupon')) {
          if (Cart::instance('cart')->subtotal() < session()->get('coupon')['cart_value'])
          {
            session()->forget('coupon');
            session()->flash('coupon_message','You cant use this coupon!');

          }else {
            $this->calculateDiscounts();
          }
        }
        $this->setAmountAfterCheckout();

        if (Auth::check())
        {
          Cart::instance('cart')->store(Auth::user()->email);
        }
        return view('livewire.cart-component')->layout('layouts.base');
    }
}
