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
      render json: {error: @carted_product.errors.full_messages}
    end
  end

  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    render :index
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    render json: {message: "item removed"}
  end
end
