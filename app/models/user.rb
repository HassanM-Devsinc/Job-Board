class User < ApplicationRecord
  has_one :applicant, dependent: :destroy
  has_many :jobs, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  enum :user_type, { job_seeker: 0, admin: 1, employer: 2}
end