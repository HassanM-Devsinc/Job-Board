class ApplicantsController < ApplicationController
  before_action :authenticate_user!

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

  # def edit
  #   @applicant = current_user&.applicant
  # end

  # def update
  #   if current_user&.applicant&.update!(applicant_params)
  #     redirect_to root_path, notice: 'Applicant data was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :email, :cnic, :linkedin_profile, user_id: current_user.id )
  end
end
