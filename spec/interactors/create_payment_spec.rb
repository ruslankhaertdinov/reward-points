require "rails_helper"

describe CreatePayment do
  subject(:result) { described_class.call(payment_attributes) }

  let!(:user) { create(:user, password: 'password') }
  let(:payment_attributes) do
    {
      user_id: user.id,
      amount: 100
    }
  end

  context "transaction valid" do
    it "creates payment" do
      expect { subject }.to change { Payment.count }.by(1)
    end

    it "updates user balance" do
      expect { subject }.to change { user.reload.balance }.by(payment_attributes[:amount])
    end
  end

  context "transaction invalid" do
    before do
      allow_any_instance_of(Payment).to receive(:save!).and_raise(ActiveRecord::Rollback)
    end

    it "does not create payment" do
      expect { subject }.not_to change { Payment.count }
    end

    it "does not update balance" do
      expect { subject }.not_to change { user.reload.balance }
    end
  end
end
