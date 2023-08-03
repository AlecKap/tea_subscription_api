Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :customers do
        resources :subscriptions, only: [:index], controller: 'customers/subscriptions'
      end
      resources :customer_subscriptions, only: %i[update create]
      resources :subscriptions, only: %i[index show destroy]
    end
  end
end
