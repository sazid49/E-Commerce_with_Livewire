<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\HomeSlider;
use Livewire\WithFileUploads;
use Carbon\Carbon;




class AdminAddHomeSliderComponent extends Component
{
    use WithFileUploads;

    public $title;
    public $subtitle;
    public $price;
    public $link;
    public $image;
    public $status;  

    public function mount()
    {
      $this->status = 0;
    }

    public function addSlide()
    {
          $slide = new HomeSlider();
          $slide->title= $this->title;
          $slide->subtitle=$this->subtitle;
          $slide->price=$this->price;
          $slide->link=$this->link;
          $imagename=Carbon::now()->timestamp.'.'.$this->image->extension();
          $this->image->storeAs('sliders',$imagename);
          $slide->image=$imagename;
          $slide->status=$this->status;
          $slide->save();
          Session()->flash('message','Slider has been added successfully!');

    }

    public function render()
    {
        return view('livewire.admin.admin-add-home-slider-component')->layout('layouts.base');
    }
}
