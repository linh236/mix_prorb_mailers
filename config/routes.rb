Rails.application.routes.draw do
  get 'site/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "site#index"
  # get "emails", to: "emails#index"
  # get "emails/new", to: "emails#new", as: "new"
  # get "emails/:id", to: "emails#show", as: "detail"
  root "emails#index"
  resources :emails, only: [:new, :create, :show, :index]
  resources :posts, only: [:index, :new, :create, :show]
  resources :templates, only: [:new, :create, :show, :index]
end
