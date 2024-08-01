require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:job) { create(:job) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:job_applicants).dependent(:destroy) }
    it { should have_many(:applicants).through(:job_applicants) }
  end

  context 'validations' do
    it 'validates presence of title' do
      expect(job).to validate_presence_of(:title)
    end

    it 'validates presence of description' do
      expect(job).to validate_presence_of(:description)
    end

    it 'validates presence of application deadline' do
      expect(job).to validate_presence_of(:application_deadline)
    end
  end

  context "ransack attributes" do
    it 'checks searchable attributes' do
      expect(Job.ransackable_attributes).to eq(['title'])
    end
  end
end