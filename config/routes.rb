Rails.application.routes.draw do
  root to: 'home#index'
  resources :books
  resources :rooms
  resources :calendar, only: [:index]
  resources :home, only: [:index]
end
