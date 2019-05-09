class User < ApplicationRecord
  has_secure_password

  has_many :payments

  validates :email, :balance, presence: true
  validates :password, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
