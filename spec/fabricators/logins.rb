require 'faker'

Fabricator(:login) do
  id                         { SecureRandom.uuid }
  session                    { Faker::Lorem.word }
  logged_in_at               { Date.today }
end

Fabricator(:invalid_login, from: :login) do
  logged_in_at               nil
end