FactoryBot.define do
  factory :user do
    username {Faker::Internet.username}
    email {Faker::Internet.email}
    password { "hassan123" }
    password_confirmation { "hassan123" }
  end
end