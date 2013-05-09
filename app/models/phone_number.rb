class PhoneNumber
  include Mongoid::EmbeddedDocument
  
  def self.phone_types
    ['mobile', 'work', 'home', 'fax', 'voip', 'pager']
  end
  
  attr_accessible :_id, :extension, :phone_number, :phone_type, :user
  
  field :_id, String
  field :phone_number, String, :required => true
  field :extension, String
  field :phone_type, String, :required => true, :in => self.phone_types
  
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
