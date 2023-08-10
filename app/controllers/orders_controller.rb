class OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      delivery: params[:delivery],
      bar_id: params[:bar_id],
      subtotal: params[:subtotal],
      total: params[:total],
    )
    if @order.save
      render json: @order.as_json
    else
      render json: { errors: @order.errors.full_messages }
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    render json: @order.as_json
  end

  def index
    @order = Order.all
    render json: @order.as_json
  end
end
