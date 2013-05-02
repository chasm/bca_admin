require 'bcrypt'

class User
  include MongoMapper::Document
  
  attr_accessible :_id, :code, :email_address, :expires_at, :is_admin, :password, :password_confirmation,
    :name_first, :name_last, :name_mi, :credit_applications, :phone_numbers
    
  attr_accessor :password, :password_confirmation
  
  key :_id, String
  key :name_first, String
  key :name_mi, String
  key :name_last, String
  key :is_admin, Boolean
  
  key :email_address, String
  
  key :hash, String
  key :salt, String
  
  key :code, String
  key :expires_at, DateTime
  
  timestamps!
  
  before_validation :downcase_email
  before_save :encrypt_password
  
  many :credit_applications
  many :phone_numbers
  many :logins

  validates :email_address, :name_first, :name_last, :presence => true
  
  validates :email_address, :uniqueness => { :case_sensitive => false }
  validates :password, :password_confirmation, :confirmation => true
  
  def name
    [self.name_first, self.name_mi, self.name_last].compact.join(' ')
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.hash == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
  def authenticate(password)
    if self.hash == BCrypt::Engine.hash_secret(password, self.salt)
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
      self.hash = BCrypt::Engine.hash_secret(password, self.salt)
      self.password = nil
    end
  end
end
