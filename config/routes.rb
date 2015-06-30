Rails.application.routes.draw do
  devise_for :users

  namespace :seller_account do
    resources :product_groups do
      resources :product_refs
    end
  end

  resources :product_refs, only: [:index, :show]

end
