class UsersController < ApplicationController
  before_action :authenticate_user! # Ensure the user is signed in

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end
end