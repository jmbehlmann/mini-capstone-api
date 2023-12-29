class Order < ApplicationRecord

  belongs_to :users
  # def product
  #   Product.find_by(id: [:product_id])
  # end

  # def subtotal
  #   product.price
  # end

  # def tax
  #   product.price * 0.09
  # end

  # def total
  #   subtotal + tax
  # end

end
