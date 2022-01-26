Rails.application.routes.draw do
  resources :rooms
  root to: 'home#index'
  resources :home, only: [:index]
  
end
