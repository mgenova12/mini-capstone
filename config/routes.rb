Rails.application.routes.draw do
  # get '/' => ''
  get '/products' => 'products#index'
  get 'products/new' => 'products#new'
  post 'products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'


  get '/images/new' => 'images#new'
  patch '/images' => 'images#create'

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "logout" => "sessions#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  post "/remove" => "carted_products#remove"

  post "/cart/:product_id" => "carted_products#create"
  get "/cart" => "carted_products#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
