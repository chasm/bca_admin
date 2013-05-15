class Employer
  include Mongoid::Document
  
  embedded_in :credit_application
  
  def self.months
    [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ]
  end
  
  attr_accessible :id, :city, :email, :from_month, :from_year,
    :job_title, :monthly_pay_before_taxes, :name_of_company,
    :name_of_supervisor, :phone_number, :to_month, :to_year,
    :web_site_url, :zip_code, :credit_application
    
  field :id, type: String
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
  
  validates :name_of_company, presence: true
  validates :from_month, presence: true
  validates :from_year, presence: true, numericality: { greater_than: 1950, less_than: Date.today.year }
  validates :monthly_pay_before_taxes, presence: true, numericality: { greater_than: 0, less_than: 50_000 }
end
