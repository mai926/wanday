Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  devise_scope :user do
    get 'account', to: 'users/registrations#new_account'
    post 'account', to: 'users/registrations#create_account'
    get 'account/:id', to: 'users/registrations#edit_account', as: 'edit_account'
    patch 'account/:id', to: 'users/registrations#update_account', as: 'update_account'
    
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  root to: "home#index"
  resources :home, only: [:index, :show]
  get 'home/likes/:id', to: 'home#like_list', as: 'home_likes'
  resources :posts do 
    resources :comments, only: :create 
    resources :likes, only: [:create, :destroy]
  end
  resources :items
end
