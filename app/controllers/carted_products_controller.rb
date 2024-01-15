class CartedProductsController < ApplicationController

  # validates :quantity, numericality: {other_than: 0 }

  def index
    @carted_products = CartedProduct.all.where(user_id: current_user.id, status: "carted")
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

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.status = "removed"
    p "------------"
    p @carted_product.status
    p "------------"
    @carted_product.save
    render json: {message: "product removed from cart"}
  end

end
