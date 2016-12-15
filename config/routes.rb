Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects, only: [:new, :create]
  get "/projects/:project", to: 'projects#show', as: :project

  root to: 'landing#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:new, :index, :create]
  end
end
