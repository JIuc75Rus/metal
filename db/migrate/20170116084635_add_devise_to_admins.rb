class AddDeviseToAdmins < ActiveRecord::Migration[5.0]
  def self.up
    create_table :admins do |t|
      t.string :email
      t.string :encrypted_password
      t.timestamps null: false
    end

    add_index :admins, :email,                unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
