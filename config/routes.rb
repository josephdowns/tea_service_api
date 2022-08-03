Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :update]
      resources :subscriptions, only: [:update]

      post "/subscriptions", to: "customers_subscriptions#create"
    end
  end
end
