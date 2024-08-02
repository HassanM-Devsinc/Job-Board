class Api::V1::MembersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.where(user_type: 2)
    render json: users
  end

  def create
    user = User.new(employer_params)
    user.password = SecureRandom.hex(4)
    user.password_confirmation = user.password

    if user.save
      EmployerMailer.with(employer: user).welcome_email.deliver_now
      render json: { message: "Employer registered successfully. A password has been sent to the employer's email." }, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def home
    user = current_user
    render json: user, status: :ok
  end

  private

  def employer_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :user_type)
  end
end