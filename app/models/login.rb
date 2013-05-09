class Login
  include Mongoid::Document
  
  attr_accessible :session, :ip_address, :user_agent, :referer, :logged_in_at, :logged_out_at, :user

  field :session, String
  field :ip_address, String
  field :user_agent, String
  field :referer, String
  field :logged_in_at, Time
  field :logged_out_at, Time
  
  # belongs_to :user

end
