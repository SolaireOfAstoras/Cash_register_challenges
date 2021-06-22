Rails.application.routes.draw do
  root 'products#index', page: "home"
  get 'products/index'
  get 'products/check_out'
  post 'products/check_out'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
