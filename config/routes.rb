Rails.application.routes.draw do
# show all
  get "/products" => "products#index"
# show 1 thing by id
  get "products/:id" => "products#show"
# create
  post "/products" => "products#create"
# update
  patch "/products/:id" => "products#update"
# delete
  delete "/products/:id" => "products#destroy"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"

  get "/suppliers" => "suppliers#index"
end
