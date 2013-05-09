class CreditApplication
  include Mongoid::Document
  include Mongoid::Timestamps
  
  def self.statuses
    ['new', 'pending', 'approved', 'denied']
  end
  
  attr_accessible :_id, :authorized, :date_of_birth, :drivers_license_number,
    :loan_amount, :sales_person, :social_security_number, :status,
    :automobile, :user, :employers, :locations, :automobile_id
  
  field :_id, String
  field :drivers_license_number, String
  field :date_of_birth, Date
  field :social_security_number, String
  field :loan_amount, Float
  field :sales_person, String
  field :authorized, Boolean
  field :status, String, :in => self.statuses, :required => true, :default => self.statuses.first
    
  # belongs_to :automobile
  # belongs_to :user
  # many :employers
  # many :locations
end
