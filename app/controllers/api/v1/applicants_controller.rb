class Api::V1::ApplicantsController < ApplicationController
  before_action :authenticate_user!

  def index
    begin
      job = Job.find(params[:job_id])
      applicants = job.applicants
      render json: applicants
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Job not found' }, status: :not_found
    end
  end

  def create
    applicant = current_user.build_applicant(applicant_params)

    if applicant.save
      render json: applicant, status: :created
    else
      render json: applicant.errors, status: :unprocessable_entity
    end
  end

  def update
    applicant = current_user.applicant
    if applicant.update(applicant_params)
      render json: applicant
    else
      render json: applicant.errors, status: :unprocessable_entity
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :cnic, :linkedin_profile, :resume)
  end
end
