Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products do
    resources :reviews, except: [:show, :index]
  end
  root 'products#index'
  get 'categories', to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
