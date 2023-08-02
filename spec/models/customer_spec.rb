require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'realationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:subscriptions).through(:customer_subscriptions) }
    it { should have_many(:teas).through(:subscriptions) }
    it { should have_many(:tea_subscriptions).through(:subscriptions) }
  end
end
