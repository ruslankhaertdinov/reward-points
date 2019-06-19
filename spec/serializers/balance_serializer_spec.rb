require "rails_helper"

describe BalanceSerializer do
  describe "#serialize" do
    subject { ActiveModelSerializers::SerializableResource.new(user, serializer: described_class).as_json }

    let(:user) { create :user }
    let(:expected_attributes) do
      {
        full_name: user.full_name,
        balance: user.balance
      }
    end

    it { is_expected.to eq(expected_attributes) }
  end
end
