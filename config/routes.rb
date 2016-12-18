Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  get '/about', to: 'about#index'

  namespace :projects do
    get '/:slug/pledges/new', to: 'pledges#new', as: :new_pledge
    post '/:slug/pledges', to: 'pledges#create', as: :pledge
  end

  resources :projects, only: [:new, :create]
  get "/projects/:slug", to: 'projects#show', as: :project
  get '/projects/:slug/edit', to: 'projects#edit', as: :edit_project
  put '/projects/:slug', to: 'projects#update'
  patch '/projects/:slug', to: 'projects#update'

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
