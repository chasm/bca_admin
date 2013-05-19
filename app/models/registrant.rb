class Registrant
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :automobile
  
  attr_accessible :id, :code, :email, :expires_at, :automobile
  
  field :id, type: String
  field :email, type: String
  field :code, type: String
  field :expires_at, type: DateTime
  
  before_validation :downcase_email
  before_create :add_code
  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  private
  
  def add_code
    self.code = SecureRandom.urlsafe_base64
    self.expires_at = DateTime.now + 1
  end
  
  def downcase_email
    self.email.downcase! if self.email
  end
end
