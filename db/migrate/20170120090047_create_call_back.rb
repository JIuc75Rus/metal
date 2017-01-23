class CreateCallBack < ActiveRecord::Migration[5.0]
  def change
    create_table :call_backs do |t|
      t.string :name
      t.string :phone
      t.string :time
      t.text :message
    end
  end
end
