class AddCategoryImagesUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :images_url, :string
  end
end
