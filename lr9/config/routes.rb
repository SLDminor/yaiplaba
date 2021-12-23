Rails.application.routes.draw do
  root 'calculation#input'
  get 'calculation/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
