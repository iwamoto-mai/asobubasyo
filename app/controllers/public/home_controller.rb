class Public::HomeController < ApplicationController
  def top
    @spot = Spot.new
    @spots = Spot.all
    @spots = @spots.where(weather: params[:weather]) if params[:weather].present?
    @spots = @spots.where('name LIKE(?)', "%#{params[:keyword]}%")
              .or(@spots.where('content LIKE(?)', "%#{params[:keyword]}%")) if params[:keyword].present?
  end
end
