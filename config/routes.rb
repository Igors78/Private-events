Rails.application.routes.draw do
  root 'events#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :events do
    member do
      get '/invite_user', to: 'events#invite_user'
      get '/dismiss_user', to: 'events#dismiss_user'
    end
  end
end
