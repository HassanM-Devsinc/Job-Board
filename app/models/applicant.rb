class Applicant < ApplicationRecord
  belongs_to :user
  has_many :job_applicants, dependent: :destroy
  has_many :jobs, through: :job_applicants
  has_one_attached :resume
end
