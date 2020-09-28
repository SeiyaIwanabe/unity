Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :events, only: [:index, :show] do
    resources :entries, only: :create
  end
  resources :users, only: [:show, :edit, :update]
end
