Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/signup', to: 'users#create'      # Signup route
  post '/login', to: 'auth#login'          # Login route
  resources :users, only: [:index, :show]  # Users routes
  namespace :api do
    resources :products do
      collection do
        get 'search'
      end
    end

    resources :orders
  end
  
  # Defines the root path route ("/")
  # root "articles#index"
end
