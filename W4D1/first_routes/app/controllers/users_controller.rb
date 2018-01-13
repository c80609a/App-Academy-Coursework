
class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user
    else
      render json: @user.errors.full_messages, status: 404
    end
  end


  def index
    # render plain: "I'm in the index action!"
    @users = User.all
    render json: @users
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user
    else
      render text: "Unable to destroy, object didn't exist"
    end
  end

  # private
  def user_params
    #TODO find out which params we even get to permit them
    params.require(:user).permit(:id, :username)
  end
end
