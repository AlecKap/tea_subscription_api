# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'simplecov'
SimpleCov.start
# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

def test_data
  Customer.destroy_all
  Subscription.destroy_all
  Tea.destroy_all
  TeaSubscription.destroy_all
  CustomerSubscription.destroy_all

  @customer1 = Customer.create!(first_name: 'Bob', last_name: 'Gu', email: 'bob@gmail.com', address: '123 Main St')
  @customer2 = Customer.create!(first_name: 'Sally', last_name: 'Shally', email: 'sally@gmail.com', address: '124 Main St')

  @subscription1 = Subscription.create!(title: 'Subscription 1', price: 1.00, frequency: 1)
  @subscription2 = Subscription.create!(title: 'Subscription 2', price: 2.00, frequency: 2)
  @subscription3 = Subscription.create!(title: 'Subscription 3', price: 3.00, frequency: 3)
  @subscription4 = Subscription.create!(title: 'Subscription 4', price: 4.00, frequency: 4)

  @tea1 = Tea.create!(title: 'Tea 1', description: 'Tea 1 description', temperature: 1, brew_time: 1)
  @tea2 = Tea.create!(title: 'Tea 2', description: 'Tea 2 description', temperature: 2, brew_time: 2)
  @tea3 = Tea.create!(title: 'Tea 3', description: 'Tea 3 description', temperature: 3, brew_time: 3)
  @tea4 = Tea.create!(title: 'Tea 4', description: 'Tea 4 description', temperature: 4, brew_time: 4)
  @tea5 = Tea.create!(title: 'Tea 5', description: 'Tea 5 description', temperature: 5, brew_time: 5)
  @tea6 = Tea.create!(title: 'Tea 6', description: 'Tea 6 description', temperature: 6, brew_time: 6)
  @tea7 = Tea.create!(title: 'Tea 7', description: 'Tea 7 description', temperature: 7, brew_time: 7)
  @tea8 = Tea.create!(title: 'Tea 8', description: 'Tea 8 description', temperature: 8, brew_time: 8)
  @tea9 = Tea.create!(title: 'Tea 9', description: 'Tea 9 description', temperature: 9, brew_time: 9)
  @tea10 = Tea.create!(title: 'Tea 10', description: 'Tea 10 description', temperature: 10, brew_time: 10)
  @tea11 = Tea.create!(title: 'Tea 11', description: 'Tea 11 description', temperature: 11, brew_time: 11)
  @tea12 = Tea.create!(title: 'Tea 12', description: 'Tea 12 description', temperature: 12, brew_time: 12)
  @tea13 = Tea.create!(title: 'Tea 13', description: 'Tea 13 description', temperature: 13, brew_time: 13)
  @tea14 = Tea.create!(title: 'Tea 14', description: 'Tea 14 description', temperature: 14, brew_time: 14)
  @tea15 = Tea.create!(title: 'Tea 15', description: 'Tea 15 description', temperature: 15, brew_time: 15)
  @tea16 = Tea.create!(title: 'Tea 16', description: 'Tea 16 description', temperature: 16, brew_time: 16)

  @tea_subscription1 = TeaSubscription.create!(tea_id: @tea1.id, subscription_id: @subscription1.id)
  @tea_subscription2 = TeaSubscription.create!(tea_id: @tea2.id, subscription_id: @subscription2.id)
  @tea_subscription3 = TeaSubscription.create!(tea_id: @tea3.id, subscription_id: @subscription3.id)
  @tea_subscription4 = TeaSubscription.create!(tea_id: @tea4.id, subscription_id: @subscription4.id)
  @tea_subscription5 = TeaSubscription.create!(tea_id: @tea5.id, subscription_id: @subscription1.id)
  @tea_subscription6 = TeaSubscription.create!(tea_id: @tea6.id, subscription_id: @subscription2.id)
  @tea_subscription7 = TeaSubscription.create!(tea_id: @tea7.id, subscription_id: @subscription3.id)
  @tea_subscription8 = TeaSubscription.create!(tea_id: @tea8.id, subscription_id: @subscription4.id)
  @tea_subscription9 = TeaSubscription.create!(tea_id: @tea9.id, subscription_id: @subscription1.id)
  @tea_subscription10 = TeaSubscription.create!(tea_id: @tea10.id, subscription_id: @subscription2.id)
  @tea_subscription11 = TeaSubscription.create!(tea_id: @tea11.id, subscription_id: @subscription3.id)
  @tea_subscription12 = TeaSubscription.create!(tea_id: @tea12.id, subscription_id: @subscription4.id)
  @tea_subscription13 = TeaSubscription.create!(tea_id: @tea13.id, subscription_id: @subscription1.id)
  @tea_subscription14 = TeaSubscription.create!(tea_id: @tea14.id, subscription_id: @subscription2.id)
  @tea_subscription15 = TeaSubscription.create!(tea_id: @tea15.id, subscription_id: @subscription3.id)
  @tea_subscription16 = TeaSubscription.create!(tea_id: @tea16.id, subscription_id: @subscription4.id)

  @customer_subscriptions1 = CustomerSubscription.create!(customer_id: @customer1.id, subscription_id: @subscription1.id)
  @customer_subscriptions2 = CustomerSubscription.create!(customer_id: @customer1.id, subscription_id: @subscription2.id)
  @customer_subscriptions3 = CustomerSubscription.create!(customer_id: @customer1.id, subscription_id: @subscription3.id, status: 'cancelled')
  @customer_subscriptions4 = CustomerSubscription.create!(customer_id: @customer1.id, subscription_id: @subscription4.id)
  @customer_subscriptions5 = CustomerSubscription.create!(customer_id: @customer2.id, subscription_id: @subscription1.id)
  @customer_subscriptions6 = CustomerSubscription.create!(customer_id: @customer2.id, subscription_id: @subscription2.id)
  @customer_subscriptions8 = CustomerSubscription.create!(customer_id: @customer2.id, subscription_id: @subscription4.id, status: 'cancelled')
end
