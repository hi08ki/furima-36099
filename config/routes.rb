Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index' 
  # resources :user

  # get 'users', to: 'users#index'
  # get 'users/new', to: 'users#new'
end
