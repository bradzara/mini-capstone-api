class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    
    order_details = product.calculate_order_details(quantity)

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: quantity,
      subtotal: order_details[:subtotal],
      tax: order_details[:tax],
      total: order_details[:total]
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
