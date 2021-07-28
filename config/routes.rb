Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users,controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#newSendingDestination'
    post 'sending_destinations', to: 'users/registrations#createSendingDestination'
  end


  devise_for :users
  root to: 'items#index'
  # resource :user,only: [:show, :index, :edit, :update] 
  resources :items,only: [:index, :new, :create]
  
  end
end


 