class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.float :weight
      t.string :unit
      t.string :description
      t.string :images_url
      t.references :itemscategory
      t.has_attached_file :images
      t.timestamps
    end
  end
end
