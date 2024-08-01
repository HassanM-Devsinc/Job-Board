require 'rails_helper'

RSpec.describe JobApplicant, type: :model do
  let(:job_applicant) { create(:job_applicant) }

  context 'associations' do
    it { should belong_to(:job) }
    it { should belong_to(:applicant) }
  end
end