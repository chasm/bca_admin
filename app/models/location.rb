class Location
  include MongoMapper::EmbeddedDocument
  
  attr_accessible :_id, :address_line_one, :address_line_two, :city,
    :from_month, :from_year, :is_owner, :monthly_rent_or_mortgage,
    :to_month, :to_year, :zip_code, :credit_application
  
  key :_id, String
  key :address_line_one, String
  key :address_line_two, Integer
  key :city, String
  key :zip_code, String
  key :from_month, String
  key :from_year, Integer
  key :to_month, String
  key :to_year, Integer
  key :monthly_rent_or_mortgage, Float
  key :is_owner, Boolean
end
