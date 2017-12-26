Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'restaurants/index'
  end

  get 'restaurants/index'

  root "restaurants#index" #把首頁設為restaurant控制器的index動作

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    collection do
      get :feeds
    end

    member do
      get :dashboard
    end
  end

  resources :categories, only: [:show]

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

  resources :users, only: [:show, :edit, :update]
end
