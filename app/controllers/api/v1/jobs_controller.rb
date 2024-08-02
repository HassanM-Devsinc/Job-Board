class Api::V1::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:update, :destroy]

  def index
    search = Job.ransack(params[:q])
    jobs = search.result
    current_employer_jobs = current_user.jobs.all
    render json: { jobs: jobs, current_employer_jobs: current_employer_jobs }
  end

  def create
    job = current_user.jobs.build(job_params)

    if job.save
      render json: job, status: :created
    else
      render json: job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @job.destroy
      head :no_content
    else
      render json: { error: 'Failed to delete job' }, status: :unprocessable_entity
    end
  end

  def apply
    applicant = current_user.applicant
    if applicant.present?
      begin
        job = Job.find(params[:id])
        applicant.jobs << job
        render json: { message: 'Applied to job successfully' }
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Job not found' }, status: :not_found
      end
    else
      render json: { error: 'Please fill your applicant form first' }, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :application_deadline)
  end

  def set_job
    begin
      @job = Job.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Job not found' }, status: :not_found
    end
  end
end