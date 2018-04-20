class UsersController < ApplicationController
  # new, create, show, index

  def new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      #redirect to index or something
    else
      flash.now[:errors] << ["User could not be created"]
      render :new
    end
  end

  def show
    render :show
  end

  


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
