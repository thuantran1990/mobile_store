Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get'/login',to: 'sessions#new'
  get '/signup', to: 'users#new'
  post'/login',to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :products
  resources :carts
  resources :orders
  resources :comments do
  	resources :sub_comments
  end
  namespace :admin do
    resources :products, only: [:new, :create, :edit, :update, :destroy]
  end
  namespace :admin do
    resources :orders, only: [:index, :edit, :update]
  end
end
