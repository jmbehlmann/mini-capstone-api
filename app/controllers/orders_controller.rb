class OrdersController < ApplicationController

  # before_action :authenticate_user

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      render template: "orders/show"
    else
      render json: {}, status: :unauthorized
    end
  end


  def create
    @carted_products = CartedProduct.all.where(user_id: current_user.id, status: "carted")

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end

    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    if @order.save
      render template: "orders/show"
    else
      render json: {message: "There was a problem creating your order"}
    end
  end

end
