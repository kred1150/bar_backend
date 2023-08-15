class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
      render template: "orders/index"
    else
      render json: [], status: :unauthorized
    end
  end

  def create
    if current_user
      @order = Order.new(
        user_id: current_user.id,
        delivery: params[:delivery],
        bar_id: params[:bar_id],
        subtotal: params[:subtotal],
        total: params[:total],
      )
      if @order.save
        render template: "orders/show"
      else
        render json: { errors: @order.errors.full_messages }
      end
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    if current_user
      @order = current_user.orders.find_by(id: params["id"])
      render template: "orders/show"
    else
      render json: [], status: :unauthorized
    end
  end
end
