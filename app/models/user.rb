require 'bcrypt'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :phone_numbers
  
  has_many :credit_applications
  has_many :logins
  
  attr_accessible :id, :code, :email, :expires_at, :is_admin, :password, :password_confirmation,
    :name_first, :name_last, :name_mi, :credit_applications, :phone_numbers, :logins
    
  attr_accessor :password, :password_confirmation
  
  field :id, type: String
  field :name_first, type: String
  field :name_mi, type: String
  field :name_last, type: String
  field :is_admin, type: Boolean, default: false
  
  field :email, type: String
  
  field :fish, type: String
  field :salt, type: String
  
  field :code, type: String
  field :expires_at, type: DateTime
  
  before_validation :downcase_email
  before_save :encrypt_password

  validates :name_first, presence: true
  validates :name_last, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true #, length: { minimum: 8 }
  validates :phone_numbers, associated: true
  
  def name
    [self.name_first, self.name_mi, self.name_last].compact.join(' ')
  end
  
  def self.authenticate(email, password)
    begin
      user = find({email: email})
      if user.fish == BCrypt::Engine.hash_secret(password, user.salt)
        user
      else
        nil
      end
    rescue
      nil
    end
  end
  
  def authenticate(password)
    if self.fish == BCrypt::Engine.hash_secret(password, self.salt)
      self
    else
      nil
    end
  end
  
  private
  
  def downcase_email
    self.email.downcase! if self.email
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end
