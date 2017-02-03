class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :diameter, :string
    add_column :items, :thickness, :string
  end
end
