class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path
  end
end
