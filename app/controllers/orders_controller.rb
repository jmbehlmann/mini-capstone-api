class OrdersController < ApplicationController

  def index
    if current_user
      @orders = current_user.orders
      render template: "orders/index"
    else
      render json: {message: "You must be logged in"}
    end
  end

  def show
    if current_user
      @order = Order.find_by(id: params[:id])
      render template: "orders/show"
    else
      render json: {message: "You must be logged in"}
    end
  end


  def create
    if current_user
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
    else
      render json: {message: "You must be logged in"}
    end
  end

end
