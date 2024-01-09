class CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.all.where(user_id: current_user.id)
    render :index
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )
    if @carted_product.save
      render json: {message: "you added a product to your cart"}
    else
      render json: {message: "There was a problem adding to your cart"}
    end
  end
end
