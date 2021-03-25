Rails.application.routes.draw do
  get 'searches/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :dashboard
  get '/hosting-dashboard', to: 'dashboard#dashboard'
  root 'static_pages#home'
  resources :users
  resources :listings do
    resources :images, only: [:create, :destroy]
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
