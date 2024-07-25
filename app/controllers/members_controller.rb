class MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where(user_type: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(employer_params)
    @user.password = SecureRandom.hex(4)
    @user.password_confirmation = @user.password

    if @user.save
      EmployerMailer.with(employer: @user).welcome_email.deliver_now
      redirect_to root_path, notice: "Employer registered successfully. A password has been sent to the employer's email."
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