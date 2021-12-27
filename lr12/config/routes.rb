Rails.application.routes.draw do
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  get 'rever/enter_form'
  get 'rever/result_table'
  resources :users
  root 'session#login'
end
