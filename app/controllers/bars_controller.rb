class BarsController < ApplicationController
  def index
    @bars = Bar.all
    render json: @bars.as_json
  end
end
