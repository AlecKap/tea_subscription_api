class Subscription < ApplicationRecord
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
end
