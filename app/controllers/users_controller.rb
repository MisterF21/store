class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'You have added a new authenticated user.'
    else
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end