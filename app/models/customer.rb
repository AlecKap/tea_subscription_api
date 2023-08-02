class Customer < ApplicationRecord
  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions
  has_many :teas, through: :subscriptions
  has_many :tea_subscriptions, through: :subscriptions
end
