Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # resource :user,only: [:show, :index, :edit, :update] 
  resources :items,only: [:index, :new, :create]
end


 