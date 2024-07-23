class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
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
end