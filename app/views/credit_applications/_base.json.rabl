attributes :id, :authorized, :date_of_birth, :drivers_license_number,
    :loan_amount, :sales_person, :social_security_number, :status,
    :automobile, :user, :employers, :locations
    
child :user do
  attributes :id, :name_first, :name_mi, :name_last, :name, :is_admin,
    :email_address, :created_at, :updated_at, :phone_numbers
end
