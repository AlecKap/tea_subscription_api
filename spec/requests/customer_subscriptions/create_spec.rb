require 'rails_helper'

describe 'create request' do
  before :each do
    test_data
  end

  describe 'happy path' do
    it 'creates a new customer subscription' do
      customer_subscription_params = {
        customer_id: @customer2.id,
        subscription_id: @subscription3.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/customer_subscriptions', headers: headers, params: JSON.generate(customer_subscription: customer_subscription_params)

      status_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(status_response).to have_key(:message)
      expect(status_response[:message]).to eq('Customer has been successfully subscribed.')

      created_customer_subscription = CustomerSubscription.last

      expect(created_customer_subscription.customer_id).to eq(@customer2.id)
      expect(created_customer_subscription.subscription_id).to eq(@subscription3.id)
    end
  end
end