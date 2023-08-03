require 'rails_helper'

describe 'subscription destroy request' do
  before :each do
    test_data
  end

  describe 'happy path' do
    it 'deletes an existing subscription' do
      Subscription.create!(title: 'Test Subscription', price: 10.00, frequency: 1)
      id = Subscription.last.id

      expect { delete "/api/v0/subscriptions/#{id}" }.to change(Subscription, :count).by(-1)
      expect(response).to be_successful

      expect { Subscription.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end