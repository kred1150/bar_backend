class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render template: "bars/index"
  end

  def show
    @bar = Bar.find_by(id: params["id"])
    render template: "bars/show"
  end

  def create
    if current_user.id == 1 || current_user.id == 2
      @bar = Bar.new(
        name: params["name"],
        price: params["price"],
        description: params["description"],
        user_id: current_user.id,
      )
      if @bar.save
        Image.create(
          url: params["image_url"],
          bar_id: @bar.id,
        )
        render template: "bars/show"
      else
        render json: { errors: @bar.errors.full_messages }, status: 422
      end
    else
      render json: { errors: "You are not authorized to create a listing!" }, status: 401
    e
  end

  # def update
  #   @bar = Bar.find_by(id: params["id"])
  #   @bar.name = params["name"] || @bar.name
  #   @bar.price = params["price"] || @bar.price
  #   @bar.description = params["description"] || @bar.description

  #   if @bar.save
  #     render template: "bars/show"
  #   else
  #     render json: { errors: @bar.errors.full_messages }, status: 422
  #   end
  # end

  def destroy
    @bar = Bar.find_by(id: params["id"])
    if @bar.user_id == current_user.id
      @bar.destroy()
      render json: { message: "Bar successfully deleted!" }
    else
      render json: { message: "You are not authorized to delete listings!" }, status: 401
    end
  end
end
