Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    get 'restaurants/index'
  end

  get 'restaurants/index'

  root "restaurants#index" #把首頁設為restaurant控制器的index動作

  namespace :admin do
    root "restaurants#index"
  end
end
