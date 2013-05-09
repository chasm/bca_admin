require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  attr_accessible :_id, :code, :email_address, :expires_at, :is_admin, :password, :password_confirmation,
    :name_first, :name_last, :name_mi, :credit_applications, :phone_numbers
    
  attr_accessor :password, :password_confirmation
  
  field :_id, String
  field :name_first, String
  field :name_mi, String
  field :name_last, String
  field :is_admin, Boolean
  
  field :email_address, String
  
  field :hashed, String
  field :salt, String
  
  field :code, String
  field :expires_at, DateTime
  
  before_validation :downcase_email
  before_save :encrypt_password
  
  # many :credit_applications
  # many :phone_numbers
  # many :logins

  validates :email_address, :name_first, :name_last, :presence => true
  
  validates :email_address, :uniqueness => { :case_sensitive => false }
  validates :password, :password_confirmation, :confirmation => true
  
  def name
    [self.name_first, self.name_mi, self.name_last].compact.join(' ')
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hashed == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
  def authenticate(password)
    if self.hashed == BCrypt::Engine.hash_secret(password, self.salt)
      self
    else
      nil
    end
  end
  
  private
  
  def downcase_email
    self.email_address.downcase!
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed = BCrypt::Engine.hash_secret(password, self.salt)
      self.password = nil
    end
  end
end
