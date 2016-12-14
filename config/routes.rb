Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :projects, only: [:new, :create]
  get "/projects/:project", to: 'projects#show', as: :project

  resources :users, only: [:new, :create, :show]

end
