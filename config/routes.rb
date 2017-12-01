Rails.application.routes.draw do
  get 'restaurants/index'

  root "restaurants#index" #把首頁設為restaurant控制器的index動作
end
