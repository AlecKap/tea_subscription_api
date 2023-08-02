class Api::V0::Customers::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end
end
