Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:new, :create, :index]
  end

  root "pages#index"
end
