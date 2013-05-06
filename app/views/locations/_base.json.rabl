attributes :id, :address_line_one, :address_line_two, :city,
    :from_month, :from_year, :is_owner, :monthly_rent_or_mortgage,
    :to_month, :to_year, :zip_code, :credit_application
    
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
