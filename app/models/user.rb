class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, confirmation: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :sanitize_email

  def sanitize_email
    self.email = email.strip.downcase
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end  
  end  
end
