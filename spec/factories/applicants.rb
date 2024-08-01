FactoryBot.define do
  factory :applicant do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    cnic {"33203-4000000-0"}
    linkedin_profile {"https://www.linkedin.com/in/hassan-murtaza"}
    association :user

    after(:build) do |applicant|
      applicant.resume.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_resume.pdf')), filename: 'test_resume.pdf', content_type: 'application/pdf')
    end
  end
end