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
end
