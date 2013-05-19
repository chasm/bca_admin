require 'faker'

Fabricator(:registrant) do
  id                         { SecureRandom.uuid }
  email                      { Faker::Internet.email }
  code                       { SecureRandom.uuid }
  expires                    { Date.today + 1 }
end

Fabricator(:invalid_registrant, from: :registrant) do
  email                      nil
end