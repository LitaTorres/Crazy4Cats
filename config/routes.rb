Rails.application.routes.draw do
  resources :comments
  resources :publications
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get 'homes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "publications#index"
   get "/publications", to: "publications#index", as: "user_root"
   post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'
   get '/my_reactions', to: 'reactions#publication_with_reactions', as: 'my_reactions'
  end

#agregue linea 14