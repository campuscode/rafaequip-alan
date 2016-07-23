Rails.application.routes.draw do
  root "home#index"
  resources :contracts, only: [:index, :show, :new, :create]
  resources :proposals, only: [:index, :show, :new, :create]
  resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index]
end
