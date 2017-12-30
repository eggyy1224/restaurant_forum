Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'restaurants/index'
  end

  get 'restaurants/index'

  root "restaurants#index" #把首頁設為restaurant控制器的index動作

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    #瀏覽所有餐廳得最新動態
    collection do
      get :feeds
      get :ranking
    end
    #查看個別餐廳的佈告欄
    member do
      get :dashboard
      post :favorite
      post :unfavorite

      post :like
      post :unlike
    end
  end

  resources :categories, only: [:show]

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

  resources :users, only: [:index, :show, :edit, :update]

  resources :followships, only: [:create, :delete]
end
