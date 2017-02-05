class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :images_url
      t.references :subcategory
      t.has_attached_file :images
      t.timestamps
    end
  end
end
