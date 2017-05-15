Rails.application.routes.draw do
  root to: 'movies#index'

  devise_for :users

  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:create], on: :member
    resources :comments, only: [:create], on: :member
  end
end
