class Admin::SpotsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @spots = Spot.all
    @spots = @spots.where(weather: params[:weather]) if params[:weather].present?
    if params[:keyword].present?
      @spots = @spots.where('name LIKE(?)', "%#{params[:keyword]}%")
                .or(@spots.where('content LIKE(?)', "%#{params[:keyword]}%"))
                .or(@spots.where('address LIKE(?)', "%#{params[:keyword]}%"))
                .or(@spots.where('id LIKE(?)', "%#{params[:keyword]}%"))
    end
  end
  
  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to admin_spots_path
  end
end
