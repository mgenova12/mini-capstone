class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :carted_products

  validates :title, presence: true 
  validates :title, uniqueness: true 
  validates :price, presence: true 
  validates :price, numericality: true 
  validates :description, presence: true 
  validates :description, length: { maximum: 500 } 



  def sale_message
    price.to_i < 2 ? "Discount Item!" : "Everyday Value!!"
  end 

  def tax 
    price.to_i * 0.08
  end

  def total 
    price.to_i + tax
  end

end
