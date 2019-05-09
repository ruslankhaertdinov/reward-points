class User < ApplicationRecord
  has_secure_password

  validates :email, :current_amount, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
