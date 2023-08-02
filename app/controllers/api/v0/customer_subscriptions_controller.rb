class Api::V0::CustomerSubscriptionsController < ApplicationController
  def create
    CustomerSubscription.create!(customer_subscription_params)
    render json: { message: 'Customer has been successfully subscribed.' }, status: :created
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id)
  end
end