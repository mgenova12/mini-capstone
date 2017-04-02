class ImagesController < ApplicationController

def new

    render 'new.html.erb'
  end


  def create



    redirect_to "/products"
  end





end
