class CreateManagementNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :management_notices do |t|
      t.integer :admin_id,            null: false, default: false
      t.string :title,                null: false
      t.text :content,                null: false

      t.timestamps
    end
  end
end
