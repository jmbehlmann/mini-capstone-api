Rails.application.routes.draw do
get "/all_products" => "products#index"
get "/product" => "products#show"
end
