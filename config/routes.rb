Rails.application.routes.draw do
  devise_for :users
  resources :animes, only: [:index, :new]
  root to: "animes#index"
end
