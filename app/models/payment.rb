class Payment < ApplicationRecord
  validates :user, :amount, :created_at, presence: true
end
