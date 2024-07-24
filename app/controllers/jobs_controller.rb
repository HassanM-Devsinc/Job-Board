class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_user.jobs.all
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
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to root_path, notice: "Job successfully updated."
    end
  end

  def destroy
    @job = Job.find(params[:id])

    if @job.destroy
      redirect_to root_path,  notice: "Job successfully deleted."
    end
  end

  def show_applicants
   @job = Job.find(params[:id])
   @applicants = @job.applicants
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :application_deadline)
  end
end
