Rails.application.routes.draw do
  get 'horses/index'

  get 'horses/create'

  get 'horses/new'

  get 'horses/destroy'

  get 'horses/show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
