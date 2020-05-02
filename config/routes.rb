Rails.application.routes.draw do
  devise_for :users
  root "contents#index"
  namespace :contents do
    resources :searches, only: :index
  end
  resources :contents do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :tags, only: :show
end
