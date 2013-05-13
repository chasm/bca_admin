require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.id { SecureRandom.uuid }
    f.name_first { Faker::Name.first_name }
    f.name_last { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.password { "!QAZxsw2" }
    f.password_confirmation { "!QAZxsw2" }
  end
  
  factory :invalid_user, parent: :user do |f|
    f.email nil
  end
end

