Rails.application.routes.draw do
  devise_for :users 

  resources :dashboard
  get '/hosting-dashboard', to: 'dashboard#dashboard'
  root 'static_pages#home'
  resources :users
end
