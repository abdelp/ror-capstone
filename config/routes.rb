Rails.application.routes.draw do
  get 'user_session/create'

  resources :time_entries
  resources :groups

  get 'login' => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
  resources :users
  # root to: 'events#index'
end
