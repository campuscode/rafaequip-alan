Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
      root "contracts#index"
  end
  root "home#index"

  authenticate :user do
      resources :equipment, only: [:index, :show, :new, :create, :edit, :update]
      resources :prices, only: [:index]
      resources :delivery_receipt, only: [:show]
      resources :customers, only: [:index, :show, :new, :create, :edit, :update]
      resources :proposals, only: [:index]

      resources :contracts, only: [:index, :show, :new, :create, :edit, :update] do
        resources :devolution_receipts, only: [:show, :new, :create]

        member do
          put 'close', to: 'contracts#close'
          post 'delivery_receipt', to: 'contracts#create_delivery_receipt'
        end
      end
  end

  resources :proposals, only: [:show, :new, :create]
end
