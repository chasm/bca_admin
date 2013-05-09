class Employer
  include Mongoid::EmbeddedDocument
  
  attr_accessible :_id, :city, :email_address, :from_month, :from_year,
    :job_title, :monthly_pay_before_taxes, :name_of_company,
    :name_of_supervisor, :phone_number, :to_month, :to_year,
    :web_site_url, :zip_code, :credit_application
    
  field :_id, String
  field :name_of_company, String
  field :phone_number, String
  field :email_address, String
  field :web_site_url, String
  field :city, String
  field :zip_code, String
  field :job_title, String
  field :name_of_supervisor, String
  field :from_month, String
  field :from_year, Integer
  field :to_month, String
  field :to_year, Integer
  field :monthly_pay_before_taxes, Float
end
