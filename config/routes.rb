Rails.application.routes.draw do

devise_for :users

resources :horses do

end

resources :bookings

# devise_for :users
root to: 'pages#home'

end
