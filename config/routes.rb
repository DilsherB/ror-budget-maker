Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :users do
    resources :transactions
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
