Rails.application.routes.draw do
  resources :projects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'password_resets/new'
  get 'password_resets/edit'
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/my-account',    to: 'users#show'
  get    '/my-account/profile' ,    to: 'users#edit'
  resources :users, except: [:edit] do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  namespace :api, format: "json" do
    namespace :v1 do
      get "users", to: "users#index"
      get "products", to: "products#index"
      get "wish", to: "wish#index"
      get "cart", to: "cart#index"
    end
  end
  resources :products, only: [:index, :show] do
    resources :reviews
  end
  resources :cart_items, only: [:create]
  resources :guest_cart_items, only: [:create]
  get 'cart', to: 'cart#index'
  resources :wish_items, only: [:create, :destroy]
  resources :guest_wish_items, only: [:create, :destroy]
  get 'wish', to: 'wish#index'

  namespace :admin do
    root 'static_pages#home'
    resources :users
    resources :products
    resources :orders
  end
end
