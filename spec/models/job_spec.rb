require 'rails_helper'

RSpec.describe Job, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:job_applicants) }
    it { should have_many(:applicants).through(:job_applicants) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:application_deadline) }
  end
end