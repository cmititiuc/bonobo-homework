class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_image
      t.text :product_description

      t.timestamps
    end
  end
end
