Rails.application.routes.draw do
  root 'proxy#input'
  get 'proxy/view'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
