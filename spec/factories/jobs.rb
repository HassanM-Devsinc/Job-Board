FactoryBot.define do
  factory :job do
    title { "Software Engineer" }
    description { "2+ Years of Experience." }
    application_deadline { 1.month.from_now }
  end
end
