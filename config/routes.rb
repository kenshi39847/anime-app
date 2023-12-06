Rails.application.routes.draw do
  devise_for :users
  resources :animes do
    collection do
      get 'search'
    end
    resources :comments, only: :create
    
    resources :netabares do
      member do
        post 'change_count'
      end
    end
    
  end
  resources :users, only: :show do
    resource :relationships, only: [:create, :destroy]
  end
  resources :profiles, only: [:new, :create, :edit, :update]
  resources :finishes, only: [:show, :create]
  resources :messages, only: :create
  resources :rooms, only: [:create, :show]
  root to: "animes#index"
end
