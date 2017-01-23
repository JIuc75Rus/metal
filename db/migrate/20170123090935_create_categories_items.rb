class CreateCategoriesItems < ActiveRecord::Migration[5.0]
  def self.up
    create_table :categories_items, id: false do |t|
      t.references :category, null: false
      t.references :item, null: false
    end

    # Add an unique index for better join speed!
    add_index(:categories_items, [:category_id, :item_id], :unique => true)
  end

  def self.down
    drop_table :categories_items
  end
end
