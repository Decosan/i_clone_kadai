Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :favorites, only:[:create,:destroy]
  resources :users do
    member do
      get :like
    end
  end
  resources :posts, only:[:index,:show,:create,:edit,:update,:destroy] do
    collection do
      post :confirm
    end
  end
end
