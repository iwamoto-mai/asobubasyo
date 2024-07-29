class Admin::SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end
  
  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to admin_spots_path
  end
end
