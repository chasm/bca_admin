class PhoneNumber
  include MongoMapper::EmbeddedDocument
  
  attr_accessible :_id, :extension, :phone_number, :phone_type, :user
  
  key :_id, String
  key :phone_number, String
  key :extension, String
  key :phone_type, String
  
  before_validation :downcase_phone_type
  
  def self.phone_types
    ['mobile', 'work', 'home', 'fax', 'voip', 'pager']
  end
  
  validates :phone_type, :inclusion => {
    :in => phone_types,
    :message => "%{value} must be one of #{phone_types.join(', ')}"
  }
  
  private
  
  def downcase_phone_type
    self.phone_type.downcase!
  end
end
