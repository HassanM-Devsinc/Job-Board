FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2024-08-03 20:33:56" }
  end
end
