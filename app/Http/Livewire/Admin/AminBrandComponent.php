<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Brand;

class AminBrandComponent extends Component
{

  public function deleteBrand($id)
  {
    $brand = Brand::find($id);
    $brand->delete();
    session()->flash('message','brand has been deleted Successfully!');
  }
    public function render()
    {
        $brands= Brand::all();
        return view('livewire.admin.amin-brand-component',['brands'=>$brands])->layout('layouts.base');
    }
}
