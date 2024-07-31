require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_one(:applicant).dependent(:destroy) }
    it { should have_many(:jobs).dependent(:destroy) }
  end

  context 'validations' do
    it 'is not valid without a username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'validates password confirmation matches password' do
      user = build(:user, password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'password confirmation not maches password' do
      user = build(:user, password: 'password', password_confirmation: 'passswordd')
      expect(user).not_to be_valid
    end

    it 'is a valid email format' do
      user = build(:user)
      expect((user.email).match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)).to eq(true)
    end

    it 'must have a valid email format' do
      user = build(:user, email: "hassan.murtaza@.devsinccom")
      expect((user.email).match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)).to eq(false)
    end
  end
end
