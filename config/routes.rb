Rails.application.routes.draw do
  root "home#index"

  resources :contracts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :devolution_receipts, only: [:show, :new, :create]

    member do
      put 'close', to: 'contracts#close'
      post 'delivery_receipt', to: 'contracts#create_delivery_receipt'
    end
  end

  resources :proposals, only: [:index, :show, :new, :create]
  resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index]
  resources :delivery_receipt, only: [:show]
  resources :customers, only: [:index, :show, :new, :create, :edit, :update]
end
