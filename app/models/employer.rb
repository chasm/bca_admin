class Employer
  include Mongoid::Document
  
  embedded_in :credit_application
  
  def self.months
    [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ]
  end
  
  attr_accessible :_id, :city, :email, :from_month, :from_year,
    :job_title, :monthly_pay_before_taxes, :name_of_company,
    :name_of_supervisor, :phone_number, :to_month, :to_year,
    :web_site_url, :zip_code, :credit_application
    
  field :_id, type: String
  field :name_of_company, type: String
  field :phone_number, type: String
  field :email, type: String
  field :web_site_url, type: String
  field :city, type: String
  field :zip_code, type: String
  field :job_title, type: String
  field :name_of_supervisor, type: String
  field :from_month, type: String
  field :from_year, type: Integer
  field :to_month, type: String
  field :to_year, type: Integer
  field :monthly_pay_before_taxes, type: Integer
  
  # validates_format_of :phone_number, with: /^(?:\+?1[-. ]?)?(?:\(?([2-9][0-9]{2})\)?[-. ]?)?([2-9][0-9]{2})[-. ]?([0-9]{4})$/
  # validates_format_of :zip_code, with: /^([0-9]{5})([ \-]?[0-9]{4})?$/
  # validates_inclusion_of :from_month, in: self.months
  # validates_inclusion_of :to_month, in: self.months
  # validates_numericality_of :from_year, greater_than: 1950, less_than: Date.today.year
  # validates_numericality_of :to_year, greater_than: 1950, less_than: Date.today.year
  # validates_numericality_of :monthly_pay_before_taxes, greater_than: 0, less_than: 50_000
  # validates_presence_of :name_of_company
  # validates_presence_of :from_month
  # validates_presence_of :from_year
end
