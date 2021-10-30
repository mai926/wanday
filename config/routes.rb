Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
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
  get 'home/follower/:id', to: 'home#follower', as: 'home_follower'
  get 'home/following/:id', to: 'home#following', as: 'home_following'
  get 'home/profile/:id', to: 'home#profile_index', as: 'home_profile_index'
  get 'home/profile/new/:id', to: 'home#profile_new', as: 'home_profile_new'
  post 'home/profile/create/:id', to: 'home#profile_create', as: 'home_profile_create'
  get 'home/profile/edit/:id', to: 'home#profile_edit', as: 'home_profile_edit'
  patch 'home/profile/update/:id', to: 'home#profile_update', as: 'home_profile_update'

  resources :posts do 
    resources :comments, only: :create 
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :items do
    resources :item_reviews, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :shops do
    resources :shop_reviews, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :calendars
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
end
