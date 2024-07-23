class ApplicantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def edits
    @applicant = current_user.applicant
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to root_path, notice: 'Applicant was successfully updated.'
    else
      render :edit
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :cnic, :resume, :linkedin_profile)
  end
end
