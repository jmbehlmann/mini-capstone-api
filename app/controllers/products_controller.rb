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
    @product = Product.new(name: "marker", price: 1, image_url: "https://s3.amazonaws.com/images.penguinmagic.com/images/soc_products/original/63343-full.png", description: "It's like a pen, but more markery")
    @product.save
    render template: "products/show"
  end
end
