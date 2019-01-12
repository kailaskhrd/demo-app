require 'sidekiq/web'

Rails.application.routes.draw do
  get 'dashboard/index'
  root to: 'dashboard#index'

  # Below for all other routes:
   devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      confirmations:'users/confirmations',
      passwords:'users/passwords',
      unlocks:'users/unlocks',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
