class CustomerTeaSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea_subscription
end