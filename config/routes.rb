Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'

  resources :projects, only: [:new, :create]
  get "/projects/:project", to: 'projects#show', as: :project

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :categories, only: [:index]
  get 'categories/:category', to: 'categories#show', as: :category

  namespace :admin do
    resources :categories, only: [:new, :index, :create, :update]
    get "/categories/:category/edit", to: 'categories#edit', as: :edit_category
  end
end
