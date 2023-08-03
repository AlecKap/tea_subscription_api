require 'rails_helper'

describe 'subscription show request' do
  before :each do
    test_data
  end

  describe 'happy path' do
    it 'returns a collection of all subscriptions' do
      id = @subscription1.id
      get "/api/v0/subscriptions/#{id}"

      expect(response).to be_successful

      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).to be_a Hash
      expect(subscription).to have_key(:data)
      expect(subscription[:data]).to be_a Hash
      expect(subscription[:data]).to have_key(:id)
      expect(subscription[:data][:id]).to be_a String
      expect(subscription[:data]).to have_key(:type)
      expect(subscription[:data][:type]).to eq('subscription')
      expect(subscription[:data]).to have_key(:attributes)
      expect(subscription[:data][:attributes]).to be_a Hash
      expect(subscription[:data][:attributes].count).to eq(3)
      expect(subscription[:data][:attributes]).to have_key(:title)
      expect(subscription[:data][:attributes][:title]).to be_a String
      expect(subscription[:data][:attributes]).to have_key(:price)
      expect(subscription[:data][:attributes][:price]).to be_a Float
      expect(subscription[:data][:attributes]).to have_key(:frequency)
      expect(subscription[:data][:attributes][:frequency]).to be_an Integer
    end
  end
end
