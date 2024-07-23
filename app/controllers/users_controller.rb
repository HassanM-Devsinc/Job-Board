class UsersController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      case @user.user_type
      when 0
        render 'job_seeker'
      when 1
        render 'admin'
      when 2
        render 'employee'
      end
    else
      redirect_to new_user_session_path
    end
  end
end