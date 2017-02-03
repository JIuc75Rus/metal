class AddSlugToItemscategories < ActiveRecord::Migration[5.0]
  def change
    add_column :itemscategories, :slug, :string
    add_index :itemscategories, :slug
  end
end
