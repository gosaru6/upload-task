Rails.application.routes.draw do

  root "boards#top"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]

  resources :boards do
    collection do
      get :favorite
    end
  end

end
