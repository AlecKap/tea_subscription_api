class Api::V0::SubscriptionsController < ApplicationController
  before_action :find_subscription, only: [:show, :destroy]

  def index
    render json: SubscriptionSerializer.new(Subscription.all)
  end

  def show
    render json: SubscriptionSerializer.new(@subscription)
  end

  def destroy
    @subscription.destroy
    render json: { message: 'Subscription has been successfully deleted.' }, status: :ok
  end

  private

  def find_subscription
    @subscription = Subscription.find(params[:id])
  end
end