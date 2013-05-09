class Location
  include Mongoid::EmbeddedDocument
  
  attr_accessible :_id, :address_line_one, :address_line_two, :city,
    :from_month, :from_year, :is_owner, :monthly_rent_or_mortgage,
    :to_month, :to_year, :zip_code, :credit_application
  
  field :_id, String
  field :address_line_one, String
  field :address_line_two, Integer
  field :city, String
  field :zip_code, String
  field :from_month, String
  field :from_year, Integer
  field :to_month, String
  field :to_year, Integer
  field :monthly_rent_or_mortgage, Float
  field :is_owner, Boolean
end
