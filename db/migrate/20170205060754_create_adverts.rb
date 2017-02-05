class CreateAdverts < ActiveRecord::Migration[5.0]
  def change
    create_table :adverts do |t|
      t.string :description
      t.string :images_url
      t.has_attached_file :images
      t.timestamps
    end
  end
end