class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    render 'public/relationships/toggle_button'
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    render 'public/relationships/toggle_button'
  end
end
