class Location
  include Mongoid::Document
  
  embedded_in :credit_application
  
  def self.months
    [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ]
  end
  
  attr_accessible :_id, :address_line_one, :address_line_two, :city,
    :from_month, :from_year, :is_owner, :monthly_rent_or_mortgage,
    :to_month, :to_year, :zip_code, :credit_application
  
  field :_id, type: String
  field :address_line_one, type: String
  field :address_line_two, type: Integer
  field :city, type: String
  field :zip_code, type: String
  field :from_month, type: String
  field :from_year, type: Integer
  field :to_month, type: String
  field :to_year, type: Integer
  field :monthly_rent_or_mortgage, type: Integer
  field :is_owner, type: Boolean
  
  # validates_format_of :zip_code, with: /^([0-9]{5})([ \-]?[0-9]{4})?$/
  # validates_inclusion_of :from_month, in: self.months
  # validates_inclusion_of :to_month, in: self.months
  # validates_numericality_of :from_year, greater_than: 1950, less_than: Date.today.year
  # validates_numericality_of :to_year, greater_than: 1950, less_than: Date.today.year
  # validates_numericality_of :monthly_rent_or_mortgage, greater_than: 0, less_than: 50_000
  # validates_presence_of :address_line_one
  # validates_presence_of :city
  # validates_presence_of :zip_code
end
