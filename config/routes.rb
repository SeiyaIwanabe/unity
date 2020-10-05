Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :users, only: [:show, :edit, :update]
  resources :events, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
    resource :entries, only: [:create]
  end
end
