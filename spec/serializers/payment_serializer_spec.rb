require "rails_helper"

describe PaymentSerializer do
  describe "#serialize" do
    subject { ActiveModelSerializers::SerializableResource.new(payment, serializer: described_class).as_json }

    let(:payment) { create :payment, user: user }
    let(:user) { create :user }
    let(:expected_attributes) do
      {
        user_full_name: user.full_name,
        amount: payment.amount,
        created_at: payment.created_at.iso8601
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end
end
