class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :title,                  null: false
      t.text :text,                     null: false
      t.integer :user_send_id
      t.integer :admin_send_id
      t.integer :user_receive_id
      t.integer :admin_receive_id
      t.boolean :release_status,         null: false, default: false
      t.timestamps
    end
  end
end
