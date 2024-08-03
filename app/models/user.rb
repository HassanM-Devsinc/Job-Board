class User < ApplicationRecord
  has_one :applicant, dependent: :destroy
  has_many :jobs, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
        #  :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  enum :user_type, { job_seeker: 0, admin: 1, employer: 2}
end