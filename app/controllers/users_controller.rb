class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

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

  def change_role
    @user = User.find(params[:id])
    if @user.role == 'TA'
      @user.update(role: 'Student')
    else
      @user.update(role: 'TA')
    end
    redirect_to users_path, notice: 'User role changed successfully.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first, :last, :password, :course_id, :role)
  end

end