class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :message
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
