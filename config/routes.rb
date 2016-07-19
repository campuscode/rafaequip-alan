Rails.application.routes.draw do
  root "home#index"
  resources :contracts, only: [:show, :new, :create]
end
