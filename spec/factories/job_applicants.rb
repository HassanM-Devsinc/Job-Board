FactoryBot.define do
  factory :job_applicant do
    association :job
    association :applicant
  end
end