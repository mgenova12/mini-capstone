class ProductsController < ApplicationController

  def car 
    @cars = Product.first

    render 'cars.html.erb'
  end

end
