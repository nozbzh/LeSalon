Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users

  get 'users/omniauth_callbacks_controller'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
