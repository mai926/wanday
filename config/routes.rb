Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  devise_scope :user do
    get 'account', to: 'users/registrations#new_account'
    post 'account', to: 'users/registrations#create_account'
    get 'account/:id', to: 'users/registrations#edit_account', as: 'edit_account'
    patch 'account/:id', to: 'users/registrations#update_account', as: 'update_account'
  end

  root to: "home#index"
  resources :home, only: [:index, :show]
  resources :posts do 
    resources :comments, only: :create 
  end
end
