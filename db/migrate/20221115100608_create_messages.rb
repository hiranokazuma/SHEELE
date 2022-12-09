class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :admin_id
      t.string :title,                  null: false
      t.text :content,                  null: false
      t.integer :kind,                  null: false
      t.boolean :release_status,        null: false, default: false
      t.timestamps
    end
  end
end
