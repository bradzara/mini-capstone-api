class OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render :index
  end
  
  def create
    calculated_subtotal = 0
    carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    p calculated_subtotal
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    p calculated_total

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save

    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = @order.id
      carted_product.save
    end

    render :show
  end


  def show 
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      render :show
    else
      render json: {}
    end
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      @order.destroy
      render json: {message: "Order has been deleted"}
    else
      render json: {}
    end
  end
end
