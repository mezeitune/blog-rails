Rails.application.routes.draw do

  
  resources :categories
  devise_for :users
  resources :articles do # recursos anidados para poder usarlo asi , articles/3/comments
  	resources :comments, only: [:create,:destroy,:update]
  end
=begin
	get "/articles" index
	post "/articles" create
	delete "/articles/:id" destroy
	get "/articles/:id" show
	get "/articles/new" new
	get "/articles/:id/edit" edit
	patch "/articles/:id" update
	put "/articles/:id" update
=end

  get 'welcome/index'
  get 'welcome/changesToDo'
  get '/dashboard', to: "welcome#dashboard"
  put "/articles/:id/publish", to: "articles#publish"
  post "/articles/toJson", to: "articles#toJson"


get '*path' => redirect('/') #Por si pone una URL inexistente  , lo redirecciona


  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
