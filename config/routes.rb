Rails.application.routes.draw do

  root "boards#top"
  resources :boards
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
