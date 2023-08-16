class UsersController < ApplicationController
  before_action :authenticate_admin, except: [:create, :destroy]

  def create
    user = User.new(
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      zip_code: params[:zip_code],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def index
    users = User.all
    render json: users.as_json
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.id == current_user.id
      user.destroy()
      render json: { message: "User successfully deleted!" }
    else
      render json: { message: "You can only delete a profile you created!" }, status: 401
    end
  end
end
