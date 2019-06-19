module V1
  module Users
    class PaymentsController < V1::BaseController
      skip_before_action :authenticate_user!

      def index
        respond_with payments, each_serializer: PaymentSummarySerializer
      end

      def create
        result = CreatePayment.call(payment_params)

        if result.success?
          respond_with result.payment
        else
          respond_with_error result.error
        end
      end

      private

      def payment_params
        params.permit(:user_id, :amount)
      end

      def user
        @user ||= User.find(payment_params[:user_id])
      end

      def payments
        Payment.includes(:user).where(users: { id: payment_params[:user_id] })
      end
    end
  end
end
