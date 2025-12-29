Rails.application.routes.draw do
  get  '/login',  to: 'login#index'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy' ,as: "logout"

  resource :session, only: [:new, :create, :destroy]

  resources :assignments, only: [:new, :create, :index, :show] do
    resources :submissions, only: [:new, :create]
  end

  resources :submissions, only: [:update]
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
