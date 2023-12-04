class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: {message: "all products"}
  end

  def show
    @product = Product.first
    render json: {message: "hello world"}
  end

end
