Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :update, :show]
      resources :subscriptions, only: [:update]

      post "/customers/:customer_id/subscriptions/:subscription_id/new", to: "customers_subscriptions#create"
      patch "/customers/:customer_id/subscriptions/:subscription_id/edit", to: "customers_subscriptions#update"
    end
  end
end
