Rails.application.routes.draw do
  devise_for :users 

  resources :dashboard
  root 'static_pages#index'
  resources :users
end
