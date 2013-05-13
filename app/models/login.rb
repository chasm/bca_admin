class Login
  include Mongoid::Document
  
  belongs_to :user
  
  attr_accessible :session, :ip_address, :user_agent, :referer, :logged_in_at, :logged_out_at, :user

  field :session, type: String
  field :ip_address, type: String
  field :user_agent, type: String
  field :referer, type: String
  field :logged_in_at, type: DateTime
  field :logged_out_at, type: DateTime

end
