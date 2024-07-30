class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    if params[:keyword].present?
      @users = @users.where('name LIKE(?)', "%#{params[:keyword]}%")
                .or(@users.where('email LIKE(?)', "%#{params[:keyword]}%"))
                .or(@users.where('id LIKE(?)', "%#{params[:keyword]}%"))
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path
  end
end
