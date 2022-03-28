<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\HomeSlider;
use Livewire\WithFileUploads;
use Carbon\Carbon;

class AdminEditHomeSliderComponent extends Component
{
      use WithFileUploads;

      public $title;
      public $subtitle;
      public $price;
      public $link;
      public $image;
      public $newimage;
      public $status;
      public $slide_id;

    public function mount($slide_id)
    {
      $slider = HomeSlider::where('id',$slide_id)->first();
      $this->title=$slider->title;
      $this->subtitle=$slider->subtitle;
      $this->price=$slider->price;
      $this->link=$slider->link;
      $this->image=$slider->image;
      $this->status=$slider->status;
      $this->slide_id=$slider->id;

    }

    public function updateSlide()
    {

      $slider = HomeSlider::find($this->slide_id);

      $slider->title =$this->title;
      $slider->subtitle=$this->subtitle;
      $slider->price=$this->price;
      $slider->link=$this->link;
      if ($this->newimage) {
        $imageName = Carbon::now()->timestamp.'.'.$this->newimage->extension();
        $this->newimage->storeAs('sliders',$imageName);
        $slider->image = $imageName;
      }
      $slider->status=$this->status;
      $slider->save();
      Session()->flash('message','Product has been update successfully!');
    }
    public function render()
    {
        return view('livewire.admin.admin-edit-home-slider-component')->layout('layouts.base');
    }
}
