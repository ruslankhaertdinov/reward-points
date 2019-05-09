class PaymentSummarySerializer < ApplicationSerializer
  attributes :user_full_name, :amount, :created_at

  def user_full_name
    object.user.full_name
  end

  def created_at
    object.created_at.iso8601
  end
end
