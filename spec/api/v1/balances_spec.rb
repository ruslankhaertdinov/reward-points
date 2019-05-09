require "rails_helper"

resource "Balances" do
  get "/v1/balances" do
    let!(:user_1) { create :user, full_name: "Michael Jordan", balance: 100 }
    let!(:user_2) { create :user, full_name: "Brad Pitt", balance: 200 }
    let!(:user_3) { create :user, full_name: "Steve Jobs", balance: 300 }

    let(:expected_data) do
      [
        {
          full_name: "Michael Jordan",
          balance: 100
        }.stringify_keys,
        {
          full_name: "Brad Pitt",
          balance: 200
        }.stringify_keys,
        {
          full_name: "Steve Jobs",
          balance: 300
        }.stringify_keys
      ]
    end

    example_request "List users balances" do
      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
