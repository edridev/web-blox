Rails.application.routes.draw do
  devise_for :users, controllers: { 
    registrations: 'users/registrations' ,
    sessions: 'users/sessions'
  }
  root to: 'home#index'
  resources :books
  resources :rooms
  resources :calendar, only: [:index]
  resources :home, only: [:index]
  get 'unreserveds/:room/:date/:hour', to: 'books#unreserveds', as: 'unreserveds'
  get 'events/:id', to: 'calendar#events'
end
