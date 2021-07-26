Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#newSendingDestination'
    post 'sending_destinations', to: 'users/registrations#createSendingDestination'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index' 

  resource :user,only: [:show,:index,:edit,:update]
  resource :item,only: [:new,:create,:update]do
    collection do
      get 'get_category_child', to: 'items#get_category_child', defaults: { format: 'json' }
      get 'get_category_grandchild', to: 'items#get_category_grandchild', defaults: { format: 'json' }
    end
  end
end


 