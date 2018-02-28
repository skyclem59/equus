Rails.application.routes.draw do
  devise_for :users
  resources :horses do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]

  # devise_for :users
  root to: 'pages#home'

end
