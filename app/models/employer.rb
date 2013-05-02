class Employer
  include MongoMapper::EmbeddedDocument
  
  attr_accessible :_id, :city, :email_address, :from_month, :from_year,
    :job_title, :monthly_pay_before_taxes, :name_of_company,
    :name_of_supervisor, :phone_number, :to_month, :to_year,
    :web_site_url, :zip_code, :credit_application
    
  key :_id, String
  key :name_of_company, String
  key :phone_number, String
  key :email_address, String
  key :web_site_url, String
  key :city, String
  key :zip_code, String
  key :job_title, String
  key :name_of_supervisor, String
  key :from_month, String
  key :from_year, Integer
  key :to_month, String
  key :to_year, Integer
  key :monthly_pay_before_taxes, Float
end
