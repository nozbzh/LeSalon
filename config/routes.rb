Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  namespace :seller_account do
    resources :product_groups do
      resources :product_refs
    end
  end

  resources :product_refs, only: [:index, :show]

  get 'users/omniauth_callbacks_controller'


end
