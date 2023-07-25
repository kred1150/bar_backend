class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render json: @bars.as_json
  end

  def show
    @bar = Bar.find_by(id: params["id"])
    render json: @bar.as_json
  end

  def create
    @bar = Bar.new(
      name: params["name"],
      price: params["price"],
      description: params["description"],
    )
    if @bar.save
      Image.create(
        url: params["image_url"],
        bar_id: @bar.id,
      )
      render json: @bar.as_json
    else
      render json: { errors: @bar.errors.full_messages }, status: 422
    end
  end

  def update
    @bar = Bar.find_by(id: params["id"])
    @bar.name = params["name"] || @bar.name
    @bar.price = params["price"] || @bar.price
    @bar.description = params["description"] || @bar.description

    if @bar.save
      render json: @bar.as_json
    else
      render json: { errors: @bar.errors.full_messages }, status: 422
    end
  end

  def destroy
    @bar = Bar.find_by(id: params["id"])
    @bar.destroy
    render json: { message: "You have successfuly deleted this bar!" }
  end
end
