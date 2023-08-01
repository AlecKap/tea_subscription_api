require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:customer_tea_subscriptions) }
  it { should have_many(:tea_subscriptions).through(:customer_tea_subscriptions) }
  it { should have_many(:teas).through(:tea_subscriptions) }
  it { should have_many(:subscriptions).through(:tea_subscriptions) }
end
