Rails.application.routes.draw do

  get 'pages/home'

  # get 'product_groups/index'

  devise_for :sellers
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :users do
    resources :bill_clients, only: [:index, :show]
  end

  resources :bill_clients, only: [:new, :create, :edit, :update, :show] do
    member do
      get :confirmation
    end

    resources :payments, only: [:new, :create]
  end





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
    # resources :order_items
    resources :orders, only: [:index, :show]
  end

  namespace :admin do
    get 'pages/home', to: "pages#home", as: :pages_home

    resources :sellers, only: [:index] do
      collection do # permet de créer une route avec un groupe
        get :approved
      end

      member do # permet de créer une route avec l'id
        patch :approve
        patch :unapprove
      end
    end
  end

  resources :product_groups, only: [:index, :show]
  # get 'product_groups/index', to: "product#:category_type"

  resources :basket_items, only: [:create, :destroy, :update]

  resources :baskets, only: [:index]

  get '/sellers/:id', to: 'sellers#show_to_user', as: :sellers_page


  resources :product_refs, only: [:index, :show]

  get 'users/omniauth_callbacks_controller'
end
