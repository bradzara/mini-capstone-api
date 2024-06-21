class CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      status: 'carted',
      quantity: params[:quantity]
    )
    if @carted_product.save
      render :show
    else
      render json: {error: carted_product.errors.full_messages}
    end
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render :show
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    render :index
  end
end
