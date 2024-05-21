class ProductsController < ApplicationController
  def index
    @products = Product.all
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    #make new product in the db
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
      inventory: params[:inventory]
    )
    if @product.save
      render template: "products/show"
    else
      render json: {errors: @product.errors.full_messages}
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      image_url: params[:image_url] || @product.image_url,
      description: params[:description] || @product.description,
      inventory: params[:inventory] || @product.inventory
    )
    render :show
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "product removed" }
  end
end