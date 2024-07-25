class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_job, only: [:edit, :update, :destroy]

  def index
    @search = Job.ransack(params[:q])
    @jobs = @search.result
    @current_employer_jobs = current_user.jobs.all
  end
  
  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.create(job_params)

    if @job.persisted?
      redirect_to root_path, notice: "Job successfully posted."
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to root_path, notice: "Job successfully updated."
    end
  end

  def destroy
    if @job.destroy
      redirect_to root_path,  notice: "Job successfully deleted."
    end
  end

  def apply
    applicant = current_user.applicant
    if applicant.present?
      job = Job.find(params[:id])
      applicant.jobs << job
      redirect_to root_path, notice: "Applied to job successfully"
    else
      redirect_to root_path, notice: "Please fill your applicant form first."
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :application_deadline)
  end

  def get_job
    @job = Job.find(params[:id])
  end
end
