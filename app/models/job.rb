class Job < ApplicationRecord
  belongs_to :user
  has_many :job_applicants, dependent: :destroy
  has_many :applicants, through: :job_applicants

  validates :title, :description, :application_deadline, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ['title']
  end
end
