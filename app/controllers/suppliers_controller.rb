class SuppliersController < ApplicationController
  def index
    @suppliers = Product.all
    render template: "suppliers/index"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render template: "suppliers/show"
  end

  def create
    #make new Supplier in the db
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number],
    )
    if @supplier.save
      render template: "suppliers/show"
    else
      render json: {errors: @supplier.errors.full_messages}
    end
  end

  def update
    @supplier = Supplier.find_by(id: params[:id])
    @supplier.update(
      name: params[:name] || @supplier.name,
      email: params[:email] || @supplier.email,
      phone_number: params[:phone_number] || @supplier.phone_number,
    )
    render :show
  end

  def destroy
    supplier = Supplier.find_by(id: params[:id])
    supplier.destroy
    render json: { message: "supplier removed" }
  end
end
