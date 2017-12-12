Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'restaurants/index'
  end

  get 'restaurants/index'

  root "restaurants#index" #把首頁設為restaurant控制器的index動作

  resources :restaurants, only: [:index, :show]

  resources :categories, only: [:show]

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
