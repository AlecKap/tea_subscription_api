require 'rails_helper'

describe 'subscription index request' do
  before :each do
    test_data
  end

  describe 'happy path' do
    it 'returns a collection of all subscriptions' do
      get '/api/v0/subscriptions'

      expect(response).to be_successful

      subscriptions = JSON.parse(response.body, symbolize_names: true)

      expect(subscriptions).to be_a Hash
      expect(subscriptions).to have_key(:data)
      expect(subscriptions[:data]).to be_an Array

      subscriptions[:data].each do |subscription|
        expect(subscription).to be_a Hash
        expect(subscription).to have_key(:id)
        expect(subscription[:id]).to be_a String
        expect(subscription).to have_key(:type)
        expect(subscription[:type]).to eq('subscription')
        expect(subscription).to have_key(:attributes)
        expect(subscription[:attributes]).to be_a Hash
        expect(subscription[:attributes].count).to eq(3)
        expect(subscription[:attributes]).to have_key(:title)
        expect(subscription[:attributes][:title]).to be_a String
        expect(subscription[:attributes]).to have_key(:price)
        expect(subscription[:attributes][:price]).to be_a Float
        expect(subscription[:attributes]).to have_key(:frequency)
        expect(subscription[:attributes][:frequency]).to be_an Integer
      end
    end
  end
end