FactoryBot.define do
  factory :payment do
    user { user }
    amount { 100 }
  end
end
