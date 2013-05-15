require 'faker'

Fabricator(:employer) do
  id                         { SecureRandom.uuid }
  name_of_company            { Faker::Company.name }
  from_month                 { Employer.months.sample }
  from_year                  { rand(Date.today.year - 1950) + 1950 }
  monthly_pay_before_taxes   { rand(50_000) }
end

Fabricator(:invalid_employer, from: :employer) do
  name_of_company            nil
end

Fabricator(:credit_application) do
  id                         { SecureRandom.uuid }
  social_security_number     { (rand(900000000) + 100000000).to_s }
  status                     { CreditApplication.statuses.shuffle.first }
  loan_amount                { rand(99000) + 999 }
end

Fabricator(:invalid_credit_application, from: :credit_application) do
  status                     nil
end

Fabricator(:credit_application_with_employers, :from => :credit_application) do
  after_build do |credit_application|
    credit_application.employers << [ Fabricate.build(:employer), Fabricate.build(:employer) ]
  end
end
