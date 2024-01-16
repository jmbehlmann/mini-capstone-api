json.id order.id
json.user_id order.user_id
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.created_at order.created_at
json.carted_products order.carted_products.map do |carted_product|
  json.id carted_product.id
  json.name carted_product.product.name
  json.price carted_product.product.price
  json.quantity carted_product.quantity
  json.images carted_product.product.images
end
