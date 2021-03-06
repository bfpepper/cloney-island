Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'landing#index'
  get '/about', to: 'about#index'

  get '/reset_password', to: 'password#confirm', as: :confirm_id
  post '/reset_password', to: 'password#find_user'
  get '/identity_confirmed', to: 'password#edit', as: :password_reset
  post '/identity_confirmed', to: 'password#update', as: :update_password

  namespace :api do
    namespace :v1 do
      namespace :projects do
        get '/:project/comments', to: 'comments#index'
        post '/:project/comments', to: 'comments#create'
      end
    end
  end

  namespace :projects do
    get '/:slug/pledges/new', to: 'pledges#new', as: :new_pledge
    post '/:slug/pledges', to: 'pledges#create', as: :pledge
  end

  resources :projects, only: [:new, :create]
  get "/projects/:slug", to: 'projects#show', as: :project
  get '/projects/:slug/edit', to: 'projects#edit', as: :edit_project
  put '/projects/:slug', to: 'projects#update'
  patch '/projects/:slug', to: 'projects#update'
  get '/projects/:slug/add_user', to: 'users/add_user#update', as: :add_user_owner
  put '/projects/:slug/add_user', to: 'users/add_user#update'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/guest_login', to: 'sessions#guest'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :categories, only: [:index]
  get 'categories/:category', to: 'categories#show', as: :category

  namespace :admin do
    resources :categories, only: [:new, :index, :create, :update]
    get "/categories/:category/edit", to: 'categories#edit', as: :edit_category
    resources :users, only: [:index]
    get "/users/:id/edit", to: 'users#edit', as: :edit_user
    put "/users/:id", to: 'users#update', as: :user
		delete "/comments/:id", to: 'comments#destroy', as: :delete_comment
	end

  get '/api_info', to: 'api#index', as: :api
end
