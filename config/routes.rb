# frozen_string_literal: true

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'static#landing'

  resources :users
  resources :posts
  resources :pins

  post 'login', to: 'auth#login'
  post 'signup', to: 'auth#signup'
end
