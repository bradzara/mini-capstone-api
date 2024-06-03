class ImagesController < ApplicationController
  def index
    @images = Image.all
    render template: "images/index"
  end

  def show
    @image = Image.find_by(id: params[:id])
    render template: "images/show"
  end

  def create
    #make new Image in the db
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id],
    )
    if @image.save!
      render template: "images/show"
    else
      render json: {errors: @image.errors.full_messages}
    end
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.update(
      url: params[:url] || @image.url,
    )
    render :show
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy
    render json: { message: "image removed" }
  end
end
