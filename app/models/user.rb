class User < ApplicationRecord
  has_one :applicant
  has_many :jobs
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  enum :user_type, { job_seeker: 0, admin: 1, employer: 2}
end