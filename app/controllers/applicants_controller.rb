class ApplicantsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_applicant, only: [:edit, :update]

  def index
    @jobs = Job.all
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

  def apply
    @job = Job.find(params[:job_id])
    current_user.applicant.jobs << @job
    redirect_to root_path, notice: "Applied to job successfully"
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :cnic, :linkedin_profile, :resume)
  end

  def get_applicant
    @applicant = current_user.applicant
  end
end
