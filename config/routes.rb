Rails.application.routes.draw do
  root "home#index" # or your actual root

  resources :users

  devise_for :users
end