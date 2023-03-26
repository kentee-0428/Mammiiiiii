Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  resources :users do
    collection do
      get :account
      get :profile
    end
  end

  root to: 'home#index'
end
