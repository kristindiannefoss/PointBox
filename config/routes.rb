Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, only: [:show, :new, :create] do
    resources :user_rewards, only: [:index, :create, :show]
    resources :points, only: [:destroy]
  end

  resources :rewards, only: [:show, :index]

  namespace "admin" do
    resources :rewards
    resources :users, only: [:show, :index, :show]
    resources :points, only: [:new, :create, :show]
    resources :user_rewards, only: [:new, :create, :edit, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
