require 'rails_helper'

describe 'a customers subscriptions index request' do
  before :each do
    test_data
  end

  describe 'happy path' do
    it 'returns a collection of all subscriptions for one customer' do
      id = @customer1.id
      get "/api/v0/customers/#{id}/subscriptions"
      
      expect(response).to be_successful
      
      subscriptions = JSON.parse(response.body, symbolize_names: true)
      # binding.pry
      expect(subscriptions).to be_a Hash
      expect(subscriptions[:data]).to be_an Array
      expect(subscriptions[:data].count).to eq(4)
      expect(subscriptions[:data][0]).to be_a Hash
      expect(subscriptions[:data][0][:id]).to be_a String
      expect(subscriptions[:data][0][:type]).to eq("subscription")
      expect(subscriptions[:data][0][:attributes]).to be_a Hash
      expect(subscriptions[:data][0][:attributes].count).to eq(3)
      expect(subscriptions[:data][0][:attributes][:title]).to be_a String
      expect(subscriptions[:data][0][:attributes][:price]).to be_a Float
      expect(subscriptions[:data][0][:attributes][:frequency]).to be_an Integer
    end
  end
end