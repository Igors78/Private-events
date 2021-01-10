Rails.application.routes.draw do
  root 'events#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[index show new create destroy] do
    member do
      get '/accept_invite', to: 'users#accept_invite'
      get '/decline_invite', to: 'users#decline_invite'
    end
  end

  resources :events do
    member do
      get '/invite_user', to: 'events#invite_user'
      get '/dismiss_user', to: 'events#dismiss_user'
      get '/dismiss_invite', to: 'users#dismiss_invite'
    end
  end
end
