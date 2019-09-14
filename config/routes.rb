Rails.application.routes.draw do
  get 'home/about'

  devise_for :users
  

  root to: 'toppages#index'
  
  resources :users, only: [:show, :edit, :update, :index]
  
  resources :books


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
