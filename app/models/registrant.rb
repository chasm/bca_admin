class Registrant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :_id, :code, :email_address, :expires_at
  
  field :_id, String
  field :email_address, String
  field :code, String
  field :expires_at, DateTime
  
  # belongs_to :automobile
  
  before_create :add_code
  
  private
  
  def add_code
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = DateTime.now + 1
  end
end
