require 'sidekiq/web'

Rails.application.routes.draw do
  get 'dashboard/index'
  root to: 'dashboard#index'

  devise_scope :user do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  # Below for all other routes:
   devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
