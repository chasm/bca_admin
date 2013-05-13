class PhoneNumber
  include Mongoid::Document
  
  embedded_in :user
  
  def self.phone_types
    ['mobile', 'work', 'home', 'fax', 'voip', 'pager']
  end
  
  attr_accessible :_id, :extension, :line_number, :phone_type
  
  field :_id, type: String
  field :line_number, type: String
  field :extension, type: String
  field :phone_type, type: String
  
  before_validation :downcase_phone_type
  
  validates_format_of :line_number, with: /^(?:\+?1[-. ]?)?(?:\(?([2-9][0-9]{2})\)?[-. ]?)?([2-9][0-9]{2})[-. ]?([0-9]{4})$/, message: "Phone number does not seem valid."
  validates_inclusion_of :phone_type, in: self.phone_types, message: "Please select a phone type from #{self.phone_types.join(', ')}."
  
  private
  
  def downcase_phone_type
    self.phone_type.downcase!
  end
end
