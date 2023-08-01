require 'rails_helper'

RSpec.describe CustomerTeaSubscription, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:tea_subscription) }
end