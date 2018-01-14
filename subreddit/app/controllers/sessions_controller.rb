class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: :destroy

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(session_params[:username], session_params[:password])

    if user.nil?
      flash.now[:errors] = ["Invalid Username or Password"]
      render :new
    else
      login(user)
      redirect_to subs_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:username, :password)
  end
end
