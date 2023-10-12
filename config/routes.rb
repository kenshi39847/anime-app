Rails.application.routes.draw do
  devise_for :users
  resources :animes, only: [:index, :new, :create]
  root to: "animes#index"
end
