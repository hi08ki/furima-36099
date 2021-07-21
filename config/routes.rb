Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index' 
  resource :user,only: [:show,:index,:edit,:update]

  get 'users', to: 'users#index'
  # get 'users/new', to: 'users#new'
end
