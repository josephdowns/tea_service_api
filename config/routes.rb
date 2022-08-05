Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :update, :show, :index] do
        resources :customers_subscriptions, only: [:index]
      end
      resources :subscriptions, only: [:update, :index]

      post "/customers/:customer_id/subscriptions/:subscription_id/new", to: "customers_subscriptions#create"
      patch "/customers/:customer_id/subscriptions/:subscription_id/edit", to: "customers_subscriptions#update"
    end
  end
end
