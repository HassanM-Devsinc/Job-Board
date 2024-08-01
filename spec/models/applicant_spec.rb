require 'rails_helper'

RSpec.describe Applicant, type: :model do
  let(:applicant) { create(:applicant) }

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:job_applicants).dependent(:destroy) }
    it { should have_many(:jobs).through(:job_applicants) }
    it { should have_one_attached(:resume) }
  end

  context 'validations' do
    it 'validates presence of name' do
      expect(applicant).to validate_presence_of(:name)
    end

    it 'validates presence of email' do
      expect(applicant).to validate_presence_of(:email)
    end

    it 'validates presence of cnic' do
      expect(applicant).to validate_presence_of(:cnic)
    end

    it 'validates presence of linkedin profile' do
      expect(applicant).to validate_presence_of(:linkedin_profile)
    end

    it 'allows valid email format' do
      expect(applicant).to allow_value('someone@example.com').for(:email)
    end

    it 'does not allow invalid email format' do
      expect(applicant).to_not allow_value('someone@example').for(:email)
      expect(applicant).to_not allow_value('someone@.com').for(:email)
      expect(applicant).to_not allow_value('someone@com').for(:email)
      expect(applicant).to_not allow_value('someone@examplecom.').for(:email)
    end

    it 'allows valid cnic format' do
      expect(applicant).to allow_value('12345-1234567-1').for(:cnic)
    end

    it 'does not allow invalid cnic format' do
      expect(applicant).to_not allow_value('1234-1234567-1').for(:cnic)
      expect(applicant).to_not allow_value('123412345671').for(:cnic)
      expect(applicant).to_not allow_value('12345-12cx567-a').for(:cnic)
    end

    it 'allows valid linkedin profile format' do
      expect(applicant).to allow_value('https://www.linkedin.com/in/hassan-murtaza').for(:linkedin_profile)
      expect(applicant).to allow_value('http://linkedin.com/in/hassan-murtaza').for(:linkedin_profile)
    end

    it 'does not allow invalid linkedin profile format' do
      expect(applicant).to_not allow_value('://linkedin.com/in/hassan-murtaza').for(:linkedin_profile)
    end
  end
end