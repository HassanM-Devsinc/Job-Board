class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applicant, only: [:edit, :update]

  def index
    begin
      @job = Job.find(params[:job_id])
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404.html', status: :not_found
    else
      @applicants = @job.applicants
    end
  end

  def new
    @applicant = current_user.build_applicant
  end

  def create
    @applicant = current_user.build_applicant(applicant_params)

    if @applicant.save
      redirect_to root_path, notice: "Applicant data was successfully created."
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to root_path, notice: 'Applicant data was successfully updated.'
    else
      render :edit
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :cnic, :linkedin_profile, :resume)
  end

  def set_applicant
    @applicant = current_user.applicant
  end
end
