class CreditApplication
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :employers
  embeds_many :locations
    
  belongs_to :automobile
  belongs_to :user
  
  def self.statuses
    ['new', 'pending', 'approved', 'denied']
  end
  
  attr_accessible :_id, :authorized, :date_of_birth, :drivers_license_number,
    :loan_amount, :sales_person, :social_security_number, :status,
    :automobile, :user, :employers, :locations, :automobile_id
  
  field :_id, type: String
  field :drivers_license_number, type: String
  field :date_of_birth, type: Date
  field :social_security_number, type: String
  field :loan_amount, type: Float
  field :sales_person, type: String
  field :authorized, type: Boolean
  field :status, type: String, default: 'new'
  
  before_validation :parse_ssn
  
  # validates_acceptance_of :authorized
  # validates_associated :employers
  # validates_associated :locations
  validates :social_security_number, presence: true, length: { is: 9 }
  validates :status, presence: true, inclusion: { in: self.statuses }
  validates :loan_amount, presence: true,  numericality: { less_than: 100_000 }
  
  private
  
  def parse_ssn
    self.social_security_number.gsub!(/\D/,"") if self.social_security_number
  end
end
