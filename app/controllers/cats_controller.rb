class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  def new
    @cat = Cat.new
   render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :edit
    else
      redirect_to cats_url
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birthdate, :color, :sex, :description)
  end
end
