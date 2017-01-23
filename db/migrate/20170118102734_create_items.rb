class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :metal
      t.string :metal_brand
      t.string :product
      t.integer :cat_id
      t.has_attached_file :images
      t.timestamps
    end
    add_index :items, :cat_id
  end
end
