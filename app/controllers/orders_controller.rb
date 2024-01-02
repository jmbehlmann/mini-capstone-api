class OrdersController < ApplicationController

  before_action :authenticate_user

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
    product = Product.find_by(id: params[:product_id])
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: product.price * params[:quantity].to_i,
      tax: product.tax * params[:quantity].to_i,
      total: product.total * params[:quantity].to_i
    )
    if @order.save
      render template: "orders/show"
    else
      render json: {message: "There was a problem creating your order"}
    end
  end

end
