class Api::V1::Users::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])
    if user.valid_password?(params[:user][:password])
      sign_in(user)
      respond_with(user, _opts={})
    else
      head(:unauthorized)
    end
  end

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: "Logged in Successfully.",
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: "Logged out." }
  end
end