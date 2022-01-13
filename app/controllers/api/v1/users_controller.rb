class Api::V1::UsersController < ApplicationController
  # GET /api/v1/users/
  # Returns an array with the list of all users
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/v1/users/:id
  # Returns the details of a single user
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # POST /api/v1/users
  # Creates a new user
  def create
    @user = User.new(user_params)
    render json: @user && return if @user.save

    render json: {error: "Unable to save user: #{@user.errors.messages}"}, status: 400
  end

  private

  # Specify which params are required, this method can be called in any action
  # but we only use it now for the create method.
  # we require the body to have the following form:
  # {
  #     "user": {
  #       "username": "foo",
  #       "password": "foobarbaz123"
  #     }
  # }
  #
  # Note that permit, as the name indicates, allows this parameters to be passed
  # but it doesn't make them mandatory.
  # By doing this we are using what's known as string parameters.
  def user_params
    params.require(:user).permit(:username, :password)
  end


end
