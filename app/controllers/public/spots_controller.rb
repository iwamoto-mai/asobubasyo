class Public::SpotsController < ApplicationController
  def index
    @spots = Spot.all
    render json: @spots
  end
  
  def show
    @spot = Spot.find(params[:id])
    respond_to do |format|
      format.html do
      end
      format.json do
      end
    end
  end
  
  def create
    @spot = current_user.spots.new(spot_params)
    if @spot.save
      flash[:notice] = "success"
      redirect_to spot_path(@spot)
    else
      @spots = Spot.all
      flash.now[:alert] = "alert"
      render 'public/home/top'
    end
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:name, :content, :address, :latitude, :longitude, :weather)
  end
end
