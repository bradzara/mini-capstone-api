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
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description]
    )
    @product.save
    render template: "products/show"
  end

  # def update
  #   @product = Product.update(
  #     description: "The Apple Watch is a versatile smartwatch that seamlessly integrates with the Apple ecosystem, offering a wide range of health, fitness, and productivity features. It comes in various models, including the Apple Watch Series 9 and Apple Watch Ultra, each boasting advanced technology such as an always-on Retina display, precise GPS tracking, and robust health monitoring tools like heart rate sensors, ECG, and blood oxygen measurement. The watch supports a multitude of apps, notifications, and customizable watch faces, providing a personalized experience. With its water resistance, fitness tracking capabilities, and the ability to make calls and send messages, the Apple Watch serves as a comprehensive companion for both everyday use and athletic pursuits."
  #   )
  # end
end
