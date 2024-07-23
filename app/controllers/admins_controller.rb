class AdminsController < ApplicationController
  def index
    @users = User.where(user_type: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(employee_params)

    if @user.persisted?
      redirect_to root_path, notice: "Employee successfully registered."
    else
      render :new 
    end
  end

  private

  def employee_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_type)
  end
end