class CreateCartedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :carted_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :status
      t.integer :quantity

      t.timestamps
    end
  end
end
