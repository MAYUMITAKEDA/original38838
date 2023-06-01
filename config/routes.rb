Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resource :comments, only: :create
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  end
end
