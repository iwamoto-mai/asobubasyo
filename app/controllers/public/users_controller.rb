class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @spots = @user.spots
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to user_path(@user)
      sign_in(:user, @user, bypass: true)
    else
      flash.now[:alert] = "failed"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "success"
    redirect_to root_url
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

  def guest_sign_in
    @user = User.find_or_initialize_by(email: "guest@test.com")
    @user.assign_attributes(
        password: SecureRandom.hex(8),
        name: "guest"
      )
    @user.save
    sign_in(:user, @user, bypass: true)
    redirect_to root_url
  end

  private

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to root_url if @user != current_user
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
