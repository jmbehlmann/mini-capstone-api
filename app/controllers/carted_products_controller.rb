class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id]
    )
    if @carted_product.save
      render json: {message: "you added a product to your cart"}
    else
      render json: {message: "There was a problem adding to your cart"}
    end
  end
end
