Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'

  resources :categories
  resources :users
  resources :doctors
  resources :appointments
  resources :stocks
    post 'stocks/new', to: 'stocks#create'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
