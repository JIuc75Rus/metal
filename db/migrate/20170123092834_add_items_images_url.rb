class AddItemsImagesUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :images_url, :string
  end
end
