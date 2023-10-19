Rails.application.routes.draw do
  devise_for :users
  resources :animes do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  resources :users, only: :show
  root to: "animes#index"
end
