Rails.application.routes.draw do
  devise_for :users
  resources :animes do
    collection do
      get 'search'
    end
    resources :comments, only: :create
    
    resources :netabares do
      member do
        post 'increment'
        post 'decrement'
      end
    end
    
  end
  resources :users, only: :show
  root to: "animes#index"
end
