Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] # ユーザーマイページへのルーティング

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'reviews#index'
  resources :reviews do
    resources :likes, only: [:create, :destroy]
  end
  
   
end
