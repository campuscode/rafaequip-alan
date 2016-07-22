Rails.application.routes.draw do
  root "home#index"
  resources :contracts, only: [:show, :new, :create] do
      resources :devolution_receipts, only: [:new, :create]
  end
  resources :proposals, only: [:index, :show, :new, :create]
  resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index]
end
