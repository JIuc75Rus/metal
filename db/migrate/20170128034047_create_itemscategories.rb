class CreateItemscategories < ActiveRecord::Migration[5.0]
  def change
    create_table :itemscategories do |t|
      t.string  :images_url
      t.text    :description
      t.string  :url
      t.string  :name, null: false, unique: true
      t.references :subcategory, index: true, foreign_key: true
      t.has_attached_file :images
      t.timestamps
    end
  end
end
