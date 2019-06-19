module V1
  class BalancesController < V1::BaseController
    skip_before_action :authenticate_user!

    def index
      respond_with users, each_serializer: BalanceSerializer
    end

    private

    def users
      User.select(:full_name, :balance)
    end
  end
end
