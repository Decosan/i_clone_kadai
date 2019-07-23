Rails.application.routes.draw do

  root to: 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'


  resources :users
  resources :sessions, only:[:create,:destroy]
  resources :posts, only:[:index,:show,:create,:edit,:update,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
