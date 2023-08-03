require 'rails_helper'

describe 'customer_subscriptionupdate request' do
  before :each do
    test_data
  end

  describe 'happy path' do
    it 'updates an existing customer subscription' do
      id = CustomerSubscription.create!(customer_id: @customer2.id, subscription_id: @subscription4.id).id
      previous_status = CustomerSubscription.last.status
      customer_subscription_params = { status: 'cancelled' }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch "/api/v0/customer_subscriptions/#{id}", headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)
      customer_subscription = CustomerSubscription.find(id)
      status_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(customer_subscription.status).to_not eq(previous_status)
      expect(customer_subscription.status).to eq('cancelled')
      expect(status_response).to have_key(:message)
      expect(status_response[:message]).to eq('Customer subscription has been cancelled.')
    end
  end
end