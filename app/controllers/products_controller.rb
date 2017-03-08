class ProductsController < ApplicationController

  def car
    @cars = Product.all

    render 'cars.html.erb'
  end

end
