# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product = Product.new(
  name: product_name_string,
  price: product_price_integer,
  image_url: url_string,
  description: description_string,
  inventory: inventory_integer
)
