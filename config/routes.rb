Rails.application.routes.draw do
  devise_for :users , controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :dashboard
  resources :users
  root 'static_pages#index'
end
