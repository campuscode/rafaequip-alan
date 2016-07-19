Rails.application.routes.draw do
  resources :equipment, only: [:show, :new, :create, :edit, :update]
end
