class Public::SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
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
  
  def edit
  end

  def update
    if @spot.update(spot_params)
      flash[:notice] = "success"
      redirect_to spot_path(@spot)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def destroy
    @spot.destroy
    flash[:success] = "success"
    redirect_to root_url
  end
  
  private
  
  def spot_params
    params.require(:spot).permit(:name, :content, :address, :latitude, :longitude, :weather)
  end
  
  def correct_user
    @spot = current_user.spots.find_by_id(params[:id])
    redirect_to root_url unless @spot
  end
end
