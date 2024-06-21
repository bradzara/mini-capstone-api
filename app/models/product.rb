class Product < ApplicationRecord
  belongs_to :supplier
  has_many :carted_products
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence:true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..1000 }

  # returns true if an item is less than or equal to $10 and false otherwise.
  def is_discounted?
    if price <= 200
      return true
    else
      false
    end
  end

  # return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
  def tax
    price * 0.09
  end

  # return the sum of the price + tax.
  def total
    price + tax
  end

  # Define the calculation method
  def calculate_order_details(quantity)
    tax_rate = 0.09
    subtotal = quantity * price
    tax = subtotal * tax_rate
    total = subtotal + tax

    {
      subtotal: subtotal,
      tax: tax,
      total: total
    }
  end


end


