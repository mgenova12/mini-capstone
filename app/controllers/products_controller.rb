class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index

    if params[:sorted] == "price_sort"
      @sorted_products = Product.all.order(:price)
    elsif params[:sorted] == "price_sort_desc"
      @sorted_products = Product.all.order(price: :desc)
    elsif params[:sorted] == "discount"
      @sorted_products = Product.where("price < ?", 100)
    elsif params[:search_term]
      @sorted_products = Product.where("title LIKE ?", "%#{params[:search_term]}%")
    elsif params[:category]
       @category = Category.find_by(name: params[:category])
       @sorted_products = @category.products
    else 
      @sorted_products = Product.all.sort_by{|product| product.id }
    end

    @random_product = Product.order("RANDOM()").first

    render 'index.html.erb'
  end

  def show 
    @product = Product.find_by(id: params[:id])

    render 'show.html.erb'
  end

  def new 

    render 'new.html.erb'
  end

  def create

    @product = Product.new(
      title: params[:form_title],
      price: params[:form_price],
      description: params[:form_description],
      supplier_id: params[:supplier_id]
      )

    if @product.save
      flash[:success] = "This product has been added"
      redirect_to "/products/#{@product.id}"
    elsif @product.errors.any?
      p @product.errors.full_messages 
      redirect_to 'new.html.erb'
    end

  end

  def edit 
    @product = Product.find_by(id: params[:id])

    render 'edit.html.erb'
  end

  def update
    
    @product = Product.find_by(id: params[:id])

    @product.update(
      title: params[:form_title],
      price: params[:form_price],
      description: params[:form_description]
      )

    flash[:warning] = "This product has been changed"

    redirect_to "/products/#{@product.id}"
  end

  def destroy

      @product = Product.find(params[:id])

      @product.destroy

    flash[:danger] = "Product #{@product.id} has been deleted"

    redirect_to "/products"
  end

end





