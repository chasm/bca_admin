class PhoneNumber
  include Mongoid::Document
  
  embedded_in :user
  
  def self.usages
    ['mobile', 'work', 'home', 'fax', 'voip', 'pager']
  end
  
  attr_accessible :id, :digits, :usage
  
  field :id, type: String
  field :digits, type: String
  field :usage, type: String
  
  before_validation :downcase_usage
  
  validates :digits, presence: true
  validates :usage, inclusion: { in: self.usages, message: "Please select a phone type from #{self.usages.join(', ')}." }
  
  private
  
  def downcase_usage
    self.usage.downcase! if self.usage
  end
end
