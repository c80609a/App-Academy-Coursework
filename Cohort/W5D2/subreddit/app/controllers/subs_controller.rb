class SubsController < ApplicationController
  before_action :require_logged_in
  before_action :require_user_owns_sub, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)

     if @sub.save
       redirect_to sub_url(@sub)
     else
       flash.now[:errors] = @sub.errors.full_messages
     end
  end

  def edit
    @sub = Sub.find(params[:id])
    if @sub.nil?
      redirect_to subs_url
    else
      render :edit
    end
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
    if @sub.nil?
      redirect_to subs_url
    else
      render :show
    end
  end



  def destroy
    subbie = Sub.find(params[:id])
    subbie.destroy
    redirect_to subs_url
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_user_owns_sub
      #if you can find that sub_id in the list of the users subs, continue on
     return if current_user.subs.find_by(id: params[:id])
     render json: 'Forbidden', status: :forbidden
  end
end
