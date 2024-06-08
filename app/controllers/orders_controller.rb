class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: product.price * params[:quantity].to_i,
      tax: product.tax * params[:quantity].to_i,
      total: (product.price * params[:quantity].to_i) + (product.tax * params[:quantity].to_i)
    )
    if @order.save
      render template: "orders/show"
    else
      render json: {errors: @order.errors.full_messages}
    end
  end

  def index
    @orders = Order.all
    render :index
  end

  def show 
    @order = Order.find_by(id: params[:id])
    render :show
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @order.destroy
    render json: {message: "Order has been deleted"}
  end
end
