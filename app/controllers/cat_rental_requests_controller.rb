class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @cat_rental_request = CatRentalRequest.new(rental_params)

    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      render json: @cat_rental_request.errors.full_messages
    end
  end

 private
 def rental_params
   params.require(:cat_rental_request).permit(:status, :cat_id, :start_date, :end_date)
 end
end
