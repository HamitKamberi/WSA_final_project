Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/login', to: 'auth#login'
  resources :users, only: [:index, :show]
  namespace :api do
    resources :products do
      collection do
        get 'search'
      end
    end

    resources :orders
    get 'order_reports/completed', to: 'order_reports#completed'
    get 'order_reports/total_profit', to: 'order_reports#total_profit'
  end
end
