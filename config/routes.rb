Rails.application.routes.draw do
  get 'restaurants/index'
  get 'restaurants/new'
  get 'restaurants/create'
  get 'restaurants/update'
  get 'restaurants/edit'
  get 'restaurants/destroy'
  get 'restaurants/show'

  root to: "restaurants#index"

  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
