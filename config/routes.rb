Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  namespace :seller_account do
    resources :picture_sellers, only: [:index, :new, :create, :destroy]
    resources :product_groups do
      resources :product_refs
    end
    get 'sellers/home', to: "sellers#home", as: :sellers_home
  end



  get '/sellers/:id', to: 'sellers#show_to_user'

  resources :product_refs, only: [:index, :show]

  get 'users/omniauth_callbacks_controller'
end
