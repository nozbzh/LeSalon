Rails.application.routes.draw do

  # get 'product_groups/index'

  devise_for :sellers
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :users do
    resources :bill_clients, only: [:index, :show]
  end

  resources :bill_clients, only: [:new, :create, :edit, :update, :show] do
    resources :payments, only: [:new, :create]
  end

  # resources :order_items, only: [:new, :create]
  # resources :orders



  namespace :seller_account do
    resources :picture_sellers, only: [:index, :new, :create, :destroy]
    resources :product_groups do
      resources :picture_products, only: [:index, :new, :create, :destroy]
      resources :product_refs do
        resources :picture_refs, only: [:create, :destroy]
      end
    end
    resources :sellers, only: [:edit, :update]
    get 'sellers/home', to: "sellers#home", as: :sellers_home
    get 'sellers/profile', to: "sellers#profile", as: :sellers_profile
  end

  resources :product_groups, only: [:index, :show]
  # get 'product_groups/index', to: "product#:category_type"

  resources :basket_items, only: [:create, :destroy, :update]

  resources :baskets, only: [:index]

  get '/sellers/:id', to: 'sellers#show_to_user', as: :sellers_page


  resources :product_refs, only: [:index, :show]

  get 'users/omniauth_callbacks_controller'
end
