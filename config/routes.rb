Rails.application.routes.draw do
  root "home#index"
  resources :contracts, only: [:show, :new, :create]
  resources :proposals, only: [:index, :show, :new, :create]
  resources :equipment, only: [:index]
end
