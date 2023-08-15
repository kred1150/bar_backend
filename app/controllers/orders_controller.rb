class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render template: "orders/index"
  end

  def create
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
  end

  def show
    @order = current_user.orders.find_by(id: params["id"])
    render template: "orders/show"
  end
end
