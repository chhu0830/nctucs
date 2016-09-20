Rails.application.routes.draw do
  root :to => "main#index"

  get '/users/sign_in' => 'main#index'
  devise_for :users,
    :controllers => {:omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :main
  resources :categories
  resources :boards
  resources :posts
  resources :comments
end
