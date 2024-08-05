class Api::V1::PrivateController < ApplicationController
  skip_before_action :verify_authenticity_token
  def test
    render json: {
      message: "This is a secret message. You are seeing it because you have successfully logged in." 
    }
  end
end
