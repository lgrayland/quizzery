class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to(@user)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :nick_name, :role)
  end

end