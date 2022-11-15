class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :user_notice_send_id
      t.integer :admin_notice_send_id
      t.integer :user_notice_receive_id
      t.integer :admin_notice_receive_id
      t.integer :notice_type
      t.boolean :read,         null: false, default: false
      t.timestamps
    end
  end
end
