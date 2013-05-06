attributes :id, :phone_type, :phone_number, :extension, :user
    
child @user do
  attributes :id
end
