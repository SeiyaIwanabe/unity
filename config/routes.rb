Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:index, :create, :show]
  resources :messages, only: [:create, :edit, :update, :destroy]

  resources :events, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :entries, only: [:create]
  end
  
end
