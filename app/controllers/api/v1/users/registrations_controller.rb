class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token

  respond_to :json
  
  def create
    user = User.new(sign_up_params)

    if user.save
      sign_in(user)
      respond_with(user, _opts = {})
    else
      register_failed(user)
    end
  end

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: "Signed up Successfully.",
      user: current_user
    }, status: :ok
  end

  def register_failed(resource)
    render json: {
      message: "Something went wrong.",
      errors: resource.errors.full_messages
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
