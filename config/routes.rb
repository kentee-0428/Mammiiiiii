Rails.application.routes.draw do

# ============== posts ======================
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end
# ============== posts ======================

# ============== users ======================
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'
    post 'users/guest_login', to: 'users/sessions#guest_login'
  end

  resources :users do
    member do
      get 'profile'
    end
  end
# ============== users ======================
  root to: 'home#index'
end
