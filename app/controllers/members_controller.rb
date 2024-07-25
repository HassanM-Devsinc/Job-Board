class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where(user_type: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(employer_params)
    if @user.persisted?
      redirect_to root_path, notice: "Employer successfully registered."
    else
      render :new 
    end
  end

  def home
    @user = current_user
    case @user.user_type
    when 0
      render 'job_seeker'
    when 1
      render 'admin'
    when 2
      render 'employer'
    end
  end

  private

  def employer_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_type)
  end
end