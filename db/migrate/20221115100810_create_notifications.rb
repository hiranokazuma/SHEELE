class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :view_application_id
      t.integer :property_id
      t.integer :message_id
      t.integer :reply_id
      t.integer :management_notice_id
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :admin_send_id
      t.integer :admin_receive_id
      t.integer :notice_type
      t.boolean :read,         null: false, default: false
      t.timestamps
    end
  end
end
