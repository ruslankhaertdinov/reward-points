class Payment < ApplicationRecord
  belongs_to :user

  validates :user, :amount, presence: true
end
