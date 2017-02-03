class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string  :images_url
      t.string  :url
      t.string  :name, null: false, unique: true
      t.integer :parent_id, index: true, foreign_key: true
      t.has_attached_file :images
      t.timestamps
    end
  end
end
