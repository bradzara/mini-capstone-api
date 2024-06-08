class Product < ApplicationRecord

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

  belongs_to :supplier
  has_many :orders
  has_many :images
end


