Rails.application.routes.draw do

  # get 'product_groups/index'

  devise_for :sellers
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :seller_account do
    resources :picture_sellers, only: [:index, :new, :create, :destroy]
    resources :product_groups do
      resources :picture_products, only: [:index, :new, :create, :destroy]
      resources :product_refs
    end
    get 'sellers/home', to: "sellers#home", as: :sellers_home
  end

  resources :product_groups, only: [:index, :show]
  # get 'product_groups/index', to: "product#:category_type"

  resources :basket_items, only: [:create]

  resources :baskets, only: [:index]

  get '/sellers/:id', to: 'sellers#show_to_user'

  resources :product_refs, only: [:index, :show]

  get 'users/omniauth_callbacks_controller'
end
