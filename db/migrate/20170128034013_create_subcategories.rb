class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string  :images_url
      t.text    :description
      t.string  :url
      t.string  :name, null: false, unique: true
      t.references :category, index: true, foreign_key: true
      t.has_attached_file :images
      t.timestamps
    end
  end
end
