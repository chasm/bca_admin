class Registrant
  include MongoMapper::Document
  
  attr_accessible :_id, :code, :email_address, :expires_at
  
  key :_id, String
  key :email_address, String
  key :code, String
  key :expires_at, DateTime
  
  timestamps!
  
  belongs_to :automobile
  
  before_create :add_code
  
  private
  
  def add_code
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = DateTime.now + 1
  end
end
