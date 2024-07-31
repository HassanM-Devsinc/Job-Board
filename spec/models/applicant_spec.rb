require 'rails_helper'

RSpec.describe Applicant, type: :model do
  let(:applicant) { build(:applicant) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:job_applicants).dependent(:destroy) }
    it { should have_many(:jobs).through(:job_applicants) }
    it { should have_one_attached(:resume) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:cnic) }
    it { should validate_presence_of(:linkedin_profile) }

    it 'is a valid email format' do
      applicant = build(:applicant)
      expect((applicant.email).match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)).to eq(true)
    end

    it 'must have a valid email format' do
      applicant = build(:applicant, email: "hassan.murtaza@.devsinccom")
      expect((applicant.email).match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)).to eq(false)
    end

    it 'is a valid cnic format' do
      applicant = build(:applicant)
      expect((applicant.cnic).match?(/\A\d{5}-\d{7}-\d\z/)).to eq(true)
    end

    it 'must have a valid cnic format' do
      applicant = build(:applicant, cnic: "3320-4000000")
      expect((applicant.cnic).match?(/\A\d{5}-\d{7}-\d\z/)).to eq(false)
    end
    
    it 'is a valid linkedin profile url format' do
      applicant = build(:applicant)
      expect((applicant.linkedin_profile).match?(/\A(https?:\/\/)?(www\.)?linkedin\.com\/(in\/[\w-]+|company\/[\w-]+|pub\/[\w-]+\/[\w-]+\/[\w-]+)?\z/)).to eq(true)
    end

    it 'must have a valid linkedin profile url format' do
      applicant = build(:applicant, linkedin_profile: "https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#using-factories")
      expect((applicant.linkedin_profile).match?(/\A(https?:\/\/)?(www\.)?linkedin\.com\/(in\/[\w-]+|company\/[\w-]+|pub\/[\w-]+\/[\w-]+\/[\w-]+)?\z/)).to eq(false)
    end
  end
end