class SessionsController < ApplicationController
  #remember, a session is for logging in

   before_action :require_logged_out, only: [:new, :create]
   before_action :require_logged_in, only: [:destroy]
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["No user found, are you sure you exist?"]
      render :new
    else
      login!(user)
      redirect_to bands_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
