
Rails.application.routes.draw do
  resources :posts
  resources :pedidos
  root 'pedidos#index'
end
