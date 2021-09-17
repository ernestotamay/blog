Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
    get 'index', to: 'home#index'
    get 'contact', to: 'home#contact'

  resources :articles do
    #video: rutas rest
    get "/user/:user_id", to: "articles#from_author", on: :collection
  end

  resources :categories











=begin
  get "articles", to: "articles#index"
  get "articles/new", to: "articles#new", as: :new_articles
  get "articles/:id", to: "articles#show"
  get "articles/:id/edit", to: "articles#edit"
  patch "articles/:id", to: "articles#update", as: :article
  post "articles", to: "articles#create"
  delete "articles/:id", to: "articles#destroy"
=end

end
