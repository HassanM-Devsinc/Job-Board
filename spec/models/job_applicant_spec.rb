require 'rails_helper'

RSpec.describe JobApplicant, type: :model do
  context 'associations' do
    it { should belong_to(:job) }
    it { should belong_to(:applicant) }
  end
end
