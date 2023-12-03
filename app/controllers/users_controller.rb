class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  before_action :authenticate_user!

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first, :last, :password, :courses, :role)
  end
end