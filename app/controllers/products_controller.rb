class ProductsController < ApplicationController

  def show
    @product = Product.first
    render json: {message: "hello world"}
  end

end
