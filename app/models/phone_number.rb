class PhoneNumber
  include MongoMapper::EmbeddedDocument
  
  def self.phone_types
    ['mobile', 'work', 'home', 'fax', 'voip', 'pager']
  end
  
  attr_accessible :_id, :extension, :phone_number, :phone_type, :user
  
  key :_id, String
  key :phone_number, String, :required => true
  key :extension, String
  key :phone_type, String, :required => true, :in => self.phone_types
  
  before_validation :downcase_phone_type
  
  validates :phone_type, :inclusion => {
    :in => phone_types,
    :message => "%{value} must be one of #{phone_types.join(', ')}"
  }
  
  private
  
  def downcase_phone_type
    self.phone_type.downcase!
  end
end
