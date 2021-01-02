Rails.application.routes.draw do
  get 'memos/index'
  get 'memos/show'
  get 'memos/new'
  get 'memos/create'
  get 'memos/edit'
  get 'memos/update'
  get 'memos/destroy'
  get 'sessions/new'
  get 'session/create'
  get 'session/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  root to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
