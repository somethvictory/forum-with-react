Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :questions, only: [:show, :new, :edit, :update, :create, :update] do
    resources :answers, only: [:create, :edit, :update]
  end
end
