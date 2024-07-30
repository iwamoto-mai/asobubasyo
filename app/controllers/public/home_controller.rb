class Public::HomeController < ApplicationController
  def top
    @spot = Spot.new
    @spots = Spot.all
    @spots = @spots.where(weather: params[:weather]) if params[:weather].present?
    if params[:keyword].present?
      @spots = @spots.where('name LIKE(?)', "%#{params[:keyword]}%")
                .or(@spots.where('content LIKE(?)', "%#{params[:keyword]}%"))
                .or(@spots.where('address LIKE(?)', "%#{params[:keyword]}%"))
    end
  end
end
