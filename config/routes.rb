Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      omniauth_callbacks: 'users/omniauth_callbacks'
    },
    path: 'auth'

  post '/login', to: 'user_sessions#create'

  get 'user_session/create'

  resources :time_entries

  resources :groups do
    resources :time_entries
  end

  delete '/logout', to: 'user_sessions#destroy'
  get '/signup', to: 'users#new'
  get 'my_time_entries' => 'users#my_time_entries'

  resources :users do
    resources :time_entries
  end

  root to: 'users#my_time_entries'
end
