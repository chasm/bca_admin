require 'faker'

Fabricator(:automobile) do
  id            { SecureRandom.uuid }
  stock_number  { Faker::Lorem.word + (rand(900) + 100).to_s }
  year          { rand(Automobile.next_year - Automobile.first_year) + Automobile.first_year }
  make          { Faker::Lorem.word.titleize }
  model         { Faker::Lorem.word.titleize }
  color         { %w(red orange yellow green blue violet white gray black).sample }
  style         { Automobile.styles.sample }
  price         { rand(Automobile.max_price - Automobile.min_price) + Automobile.min_price }
  status        { Automobile.statuses.sample }
end

Fabricator(:invalid_automobile, from: :automobile) do
  stock_number nil
end