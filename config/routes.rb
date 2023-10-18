Rails.application.routes.draw do
  devise_for :users
  resources :animes do

    resources :comments, only: :create

    resources :netabares, only: [:create] # ネタバレリソースに対するcreateアクションのルーティング
    member do
    put 'increment_netabare_count', to: 'netabares#increment', as: 'increment_netabare_count'
    put 'decrement_netabare_count', to: 'netabares#decrement', as: 'decrement_netabare_count'
    end

    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  root to: "animes#index"
end
