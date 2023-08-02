class Api::V0::CustomerSubscriptionsController < ApplicationController
  def create
    CustomerSubscription.create!(customer_subscription_params)
    render json: { message: 'Customer has been successfully subscribed.' }, status: :created
  end

  def update
    CustomerSubscription.find(params[:id]).update!(customer_subscription_params)
    render json: { message: 'Customer subscription has been cancelled.' }, status: :ok
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id, :status)
  end
end