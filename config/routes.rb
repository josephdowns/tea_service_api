Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :update]
      resources :subscriptions, only: [:create, :update]
    end
  end
end
