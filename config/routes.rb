Rails.application.routes.draw do
  get 'users/omniauth_callbacks_controller'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
