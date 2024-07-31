require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_one(:applicant).dependent(:destroy) }
    it { should have_many(:jobs).dependent(:destroy) }
  end

  context 'validations' do
    it 'validates presence of username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
    end

    it 'validates presence of email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'validates password confirmation matches password' do
      user = build(:user, password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'validates password confirmation' do
      user = build(:user, password: 'password', password_confirmation: 'passswordd')
      expect(user).not_to be_valid
    end
  end
end
