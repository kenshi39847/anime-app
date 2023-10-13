Rails.application.routes.draw do
  devise_for :users
  resources :animes, only: [:index, :new, :create]
  resources :users, only: :show
  root to: "animes#index"
end
