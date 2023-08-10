Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bars" => "bars#index"
  get "/bars/:id" => "bars#show"
  post "/bars" => "bars#create"
  patch "/bars/:id" => "bars#update"
  delete "/bars/:id" => "bars#destroy"

  post "/users" => "users#create"
  get "/users" => "users#index"

  post "/sessions" => "sessions#create"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"
end
