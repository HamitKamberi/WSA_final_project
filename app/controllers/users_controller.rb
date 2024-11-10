class UsersController < ApplicationController
  # Skip authorization on the 'create' action for signup
  skip_before_action :authorize_request, only: [:create]
  before_action :authorize_admin!, only: [:index, :show]

  # POST /signup (Signup)
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({ user_id: user.id, role: user.role })
      render json: { token: token, user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /users (Index - Admin Only)
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id (Show Admin Only)
  def show
    user = User.find(params[:id])
    authorize user
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def authorize_admin!
    authorize User
  end
end
