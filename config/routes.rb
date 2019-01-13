require 'sidekiq/web'
require 'api_version'
Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      resources :roles
      post   "/sign-in"       => "sessions#create"
      delete "/sign-out"      => "sessions#destroy"
    end
  end

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
