class AddOrderIdToCartedProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :order_id, :integer
  end
end
