class Image < ApplicationRecord
  belongs_to :products
  

  validates :url, presence: true 
  


end
