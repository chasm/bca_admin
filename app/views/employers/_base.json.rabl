attributes :id, :city, :email, :from_month, :from_year,
    :job_title, :monthly_pay_before_taxes, :name_of_company,
    :name_of_supervisor, :phone_number, :to_month, :to_year,
    :web_site_url, :zip_code, :credit_application
    
child @credit_application do
  attributes :id, :authorized, :date_of_birth, :drivers_license_number,
    :loan_amount, :sales_person, :social_security_number, :status,
    :automobile, :user
    
  child :user do
    attributes :id, :name
  end
  
  child :automobile do
    attributes :id, :name
  end
end
