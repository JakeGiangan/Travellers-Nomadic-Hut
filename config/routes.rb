Rails.application.routes.draw do
  devise_for :users 

  resources :dashboard
  resources :users
  root 'static_pages#index'
end
