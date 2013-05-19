require 'faker'

Fabricator(:phone_number) do
  id                     { SecureRandom.uuid }
  digits                 { Faker::PhoneNumber.phone_number }
  usage                  { PhoneNumber.usages.sample }
end

Fabricator(:invalid_phone_number, from: :phone_number) do
  digits                 nil
end

Fabricator(:user) do
  id                     { SecureRandom.uuid }
  name_first             { Faker::Name.first_name }
  name_last              { Faker::Name.last_name }
  email                  { Faker::Internet.email }
  password               "!QAZxsw2"
  password_confirmation  "!QAZxsw2"
end

Fabricator(:invalid_user, from: :user) do
  email                   nil
end

Fabricator(:user_with_phones, :from => :user) do
  after_build do |user|
    user.phone_numbers << [ Fabricate.build(:phone_number), Fabricate.build(:phone_number) ]
  end
end