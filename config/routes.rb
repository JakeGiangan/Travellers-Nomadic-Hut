Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :dashboard
  get '/hosting-dashboard', to: 'dashboard#dashboard'
  root 'static_pages#home'
  resources :users

  resources :listings do
    member do
      get 'room'
      get 'description'
      get 'price'
      get 'photos'
      get 'amenity'
      get 'location'
    end
  end
end
