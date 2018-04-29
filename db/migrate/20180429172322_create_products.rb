class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_image
      t.text :product_description

      t.timestamps
    end
    add_index :products, :product_name, name: 'product_name', type: :fulltext
  end
end
