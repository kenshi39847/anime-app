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
    resources :profiles, only: [:new, :create, :edit, :update]
  end
  root to: "animes#index"
end
