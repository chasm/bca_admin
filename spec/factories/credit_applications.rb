require 'faker'

FactoryGirl.define do
  factory :credit_application do |f|
    f.id { SecureRandom.uuid }
    f.social_security_number { (rand(900000000) + 100000000).to_s }
    f.status { CreditApplication.statuses.shuffle.first }
    f.loan_amount { rand(99000) + 999 }
  end
  
  factory :invalid_credit_application, parent: :credit_application do |f|
    f.status nil
  end
end

