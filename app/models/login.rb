class Login
  include MongoMapper::Document
  
  attr_accessible :session, :ip_address, :user_agent, :referer, :logged_in_at, :logged_out_at, :user

  key :session, String
  key :ip_address, String
  key :user_agent, String
  key :referer, String
  key :logged_in_at, Time
  key :logged_out_at, Time
  
  belongs_to :user

end
