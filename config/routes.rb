Rails.application.routes.draw do
  get 'chatrooms', to: 'chat_rooms#index'

  post 'message', to: 'messages#create'
  mount ActionCable.server, at: '/cable'

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'

  root 'home_pages#home'
  get 'help', to:'home_pages#help'
  get '/about', to:'home_pages#about'
  get '/contact', to:'home_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  #/users/1/following や /users/1/followers になるように
  #memberメソッドによりユーザーidが含まれたものを扱う
  resources :users do
    member do
      get:following, :followers, :mutual, :profile
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only:[:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
