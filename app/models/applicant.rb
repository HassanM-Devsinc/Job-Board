class Applicant < ApplicationRecord
  belongs_to :user
  has_many :job_applicants, dependent: :destroy
  has_many :jobs, through: :job_applicants
  has_one_attached :resume

  validates :name, :linkedin_profile, presence: true
  validates :resume, attached: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :cnic, presence: true, format: { with: /\A\d{5}-\d{7}-\d\z/ }
end