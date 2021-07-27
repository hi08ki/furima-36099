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

  resource :user,only: [:show, :index, :edit, :update]
  resource :items,only: [:index, :new, :create, :destroy, :edit, :show] do
    collection do
      get 'get_category_child', to: 'items#get_category_child', defaults: { format: 'json' }
      get 'get_category_grandchild', to: 'items#get_category_grandchild', defaults: { format: 'json' }
    end
  end
end


 