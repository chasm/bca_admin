require 'faker'

FactoryGirl.define do
  factory :automobile do |f|
    f.id { SecureRandom.uuid }
    f.stock_number { Faker::Lorem.word + (rand(900) + 100).to_s }
    f.year { rand(Automobile.next_year - Automobile.first_year) + Automobile.first_year }
    f.make { Faker::Lorem.word.titleize }
    f.model { Faker::Lorem.word.titleize }
    f.color {  %w[red orange yellow green blue violet white gray black].shuffle.first }
    f.style { Automobile.styles.shuffle.first }
    f.price { rand(Automobile.max_price - Automobile.min_price) + Automobile.min_price }
    f.status { Automobile.statuses.shuffle.first }
  end
  
  factory :invalid_automobile, parent: :automobile do |f|
    f.stock_number nil
  end
end

