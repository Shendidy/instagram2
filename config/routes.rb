Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'posts/edit'

  resources :posts

  root to: 'home#index'
end
