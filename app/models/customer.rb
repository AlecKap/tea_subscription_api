class Customer < ApplicationRecord
  has_many :customer_tea_subscriptions
  has_many :tea_subscriptions, through: :customer_tea_subscriptions
  has_many :teas, through: :tea_subscriptions
  has_many :subscriptions, through: :tea_subscriptions
end
