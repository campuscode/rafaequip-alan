Rails.application.routes.draw do
  root 'home#index'
  resources :proposals, only: [:index, :show, :new, :create]
end
