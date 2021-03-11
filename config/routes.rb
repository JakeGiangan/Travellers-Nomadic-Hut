Rails.application.routes.draw do
  root 'static_pages#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
