class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.has_attached_file :images
      t.timestamps
    end
  end
end
