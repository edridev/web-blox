Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :books
  resources :rooms
  resources :calendar, only: [:index]
  resources :home, only: [:index]
  get 'unreserveds/:room/:date/:hour', to: 'books#unreserveds', as: 'unreserveds'
end
