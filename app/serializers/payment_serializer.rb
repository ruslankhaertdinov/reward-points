class PaymentSerializer < ApplicationSerializer
  attributes :user_id, :amount, :created_at

  def created_at
    object.created_at.iso8601
  end
end
