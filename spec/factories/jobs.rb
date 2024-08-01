FactoryBot.define do
  factory :job do
    title {Faker::Job.title}
    description {Faker::Lorem.paragraph}
    application_deadline {Faker::Time.forward(days: 30, period: :all)}
    association :user
  end
end
