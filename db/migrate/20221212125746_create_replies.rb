class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :admin_id
      t.integer :message_id
      t.text :content,                  null: false
      t.timestamps
    end
  end
end
