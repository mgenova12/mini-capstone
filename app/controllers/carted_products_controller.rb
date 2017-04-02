class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def create 
    
    @cart = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      status: "carted",
      quantity: params[:quantity]
      )
    @cart.save

    p @cart
    p '*' * 50 
    @cart.errors.full_messages
    p '*' * 50 

    flash[:success] = "This product has been added to the cart"

    redirect_to '/cart'
  end


  def show 

    @carted_products = CartedProduct.where(user_id: current_user.id).where(status: 'carted')

    render 'show.html.erb'
  end

  def remove 

    @item = CartedProduct.where(user_id: current_user.id).where(status: 'carted').find_by(product_id: params[:product_id])
    

    @item.update(
      status: "removed"
    )

    redirect_to '/cart'
  end

end
