Rails.application.routes.draw do
  resources :horses

  devise_for :users
  root to: 'horses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
