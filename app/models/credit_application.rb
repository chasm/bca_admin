class CreditApplication
  include MongoMapper::Document
  
  def self.statuses
    ['new', 'pending', 'approved', 'denied']
  end
  
  attr_accessible :_id, :authorized, :date_of_birth, :drivers_license_number,
    :loan_amount, :sales_person, :social_security_number, :status,
    :automobile, :user, :employers, :locations, :automobile_id
  
  key :_id, String
  key :drivers_license_number, String
  key :date_of_birth, Date
  key :social_security_number, String
  key :loan_amount, Float
  key :sales_person, String
  key :authorized, Boolean
  key :status, String, :in => self.statuses, :required => true, :default => self.statuses.first
  
  timestamps!
    
  belongs_to :automobile
  belongs_to :user
  many :employers
  many :locations
end
