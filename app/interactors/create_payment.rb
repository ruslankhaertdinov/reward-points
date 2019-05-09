class CreatePayment
  include Interactor

  delegate :user_id, :amount, to: :context

  def call
    create_payment || context.fail!(error: :cant_create)
    context.payment = payment
  end

  private

  def create_payment
    user.with_lock do
      user.balance = user.balance + amount
      payment.save!
      user.save!
    end
  end

  def user
    @user ||= User.find(user_id)
  end

  def payment
    @payment ||= Payment.new(user_id: user.id, amount: amount)
  end
end
