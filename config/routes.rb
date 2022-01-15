Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :dashboard, only: [:index]
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  resources :announcements, only: [:new, :create]

end


