class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @spots = @user.spots
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end
  
  def favorites
    @user = User.find(params[:id])
    @spots = @user.favorite_spots
  end
end
