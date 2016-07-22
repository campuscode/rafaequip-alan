Rails.application.routes.draw do
  root "home#index"
  
  resources :contracts, only: [:show, :new, :create] do
    member do
      post 'delivery_receipt', to: 'contracts#create_delivery_receipt' 
    end
  end

  resources :proposals, only: [:index, :show, :new, :create]
  resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index]
end
