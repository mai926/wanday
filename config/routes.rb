Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }  
  devise_scope :user do
    get 'account', to: 'users/registrations#new_account'
    post 'account', to: 'users/registrations#create_account'
  end

  root to: "posts#new"
  resources :home, only: :index
  resources :posts, only: [:new, :create, :edit, :update, :show]
end
