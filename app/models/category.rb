class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products

  # def products
  #   final = []
  #   category_products.each do |cp|
  #     final << cp.product
  #   end
  #   final
  # end
end
