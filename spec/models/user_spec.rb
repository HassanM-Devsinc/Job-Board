require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'associations' do
    it { should have_one(:applicant).dependent(:destroy) }
    it { should have_many(:jobs).dependent(:destroy) }
  end

  context 'validations' do
    it 'validates presence of username' do
      expect(user).to validate_presence_of(:username)
    end

    it 'allows valid email format' do
      expect(user).to allow_value('someone@example.com').for(:email)
    end

    it 'does not allow invalid email format' do
      expect(user).to_not allow_value('someone@example').for(:email)
      expect(user).to_not allow_value('someone@.com').for(:email)
      expect(user).to_not allow_value('someone@com').for(:email)
      expect(user).to_not allow_value('someone@examplecom.').for(:email)
    end

    it 'validates password confirmation matches password' do
      expect(user).to be_valid
    end

    it 'validates password confirmation not maches password' do
      user = build(:user, password_confirmation: 'hassan12345')
      expect(user).not_to be_valid
    end
  end
end
