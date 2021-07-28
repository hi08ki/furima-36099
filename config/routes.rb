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


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index' 
  resources :articles

  resource :user,only: [:show, :index, :edit, :update] do
  resource :items,only: [:index, :new, :create] do
  end
end


 