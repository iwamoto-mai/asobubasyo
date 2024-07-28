class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @spot = Spot.find(params[:spot_id])
    current_user.favorite(@spot)
    render 'public/favorites/toggle_button'
  end
  
  def destroy
    @spot = Spot.find(params[:spot_id])
    current_user.unfavorite(@spot)
    render 'public/favorites/toggle_button'
  end
end
