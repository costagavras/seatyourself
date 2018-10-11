Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#home"
  resources :users
  resources :sessions
  resources :restaurants
  resources :reservations
  get "/home" => "pages#home"
end
