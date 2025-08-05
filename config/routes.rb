Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :cars
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  
  get "up" => "rails/health#show", as: :rails_health_check
  get "about" => "about#index"
  get "home" => "home#index"
  #get "cars" => "cars#index"
  #get "sign_up" => "registrations#new"
  #post "users" => "registrations#create"
  root "home#index"
 #resources :users, only: [:create], controller: "registrations"
 get 'sign_up', to: 'registrations#new', as: :sign_up
end
