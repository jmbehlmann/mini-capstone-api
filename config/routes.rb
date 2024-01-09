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

  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"
end
