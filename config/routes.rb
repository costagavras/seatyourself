Rails.application.routes.draw do
  root "pages#home"

  resources :users
  resources :sessions

  get "/home" => "pages#home"
end
