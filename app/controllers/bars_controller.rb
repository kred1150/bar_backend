class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render json: @bars.as_json
  end

  def show
    @bar = Bar.find_by(id: params["id"])
    render json: @bar.as_json
  end
end
