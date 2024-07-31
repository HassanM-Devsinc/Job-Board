require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_one(:applicant).dependent(:destroy) }
    it { should have_many(:jobs).dependent(:destroy) }
  end
end
