attributes :id, :phone_type, :phone_number, :extension
    
child @user do
  attributes :id, :name
end
