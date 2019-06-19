require "rails_helper"

resource "User Payments" do
  let!(:user) { create :user }

  post "/v1/users/:user_id/payments" do
    parameter :user_id, "payment recipient"
    parameter :amount, "payment amount"

    let(:user_id) { user.id }
    let(:amount) { 250 }
    let(:payment) { Payment.first }

    let(:expected_data) do
      {
        amount: amount,
        created_at: payment.created_at.iso8601,
        user_id: user_id
      }.stringify_keys
    end

    example_request "Create Payment" do
      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_data)
    end
  end

  get "/v1/users/:user_id/payments" do
    parameter :user_id, "data recipient"

    let(:user_id) { user.id }
    let!(:user2) { create :user }
    let!(:payment1) { create :payment, user: user }
    let!(:payment2) { create :payment, user: user }
    let!(:payment3) { create :payment, user: user2 }

    let(:expected_data) do
      [
        {
          user_full_name: user.full_name,
          amount: payment1.amount,
          created_at: payment1.created_at.iso8601
        }.stringify_keys,
        {
          user_full_name: user.full_name,
          amount: payment2.amount,
          created_at: payment2.created_at.iso8601
        }.stringify_keys
      ]
    end

    example_request "List user payments" do
      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
