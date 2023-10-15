Rails.application.routes.draw do
  devise_for :users
  resources :animes
  resources :users, only: :show
  root to: "animes#index"
end
