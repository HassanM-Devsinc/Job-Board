class EmployerMailer < ApplicationMailer
  def welcome_email
    @employer = params[:employer]
    @password = @employer.password
    mail(to: @employer.email, subject: "Welcome To Job Board!")
  end
end
