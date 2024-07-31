FactoryBot.define do
  factory :user do
    username {"Hassan"}
    email { "hassan123@gmail.com" }
    password { "hassan123" }
    password_confirmation { "hassan123" }
  end
end
