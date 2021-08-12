Rails.application.routes.draw do
  resources :beats
  devise_for :users

  root to: 'beats#index'
end