class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user,               foreign_key: true
      t.references :admin,              foreign_key: true
      t.string :title,                  null: false
      t.text :content,                  null: false
      t.integer :kind,                  null: false
      t.boolean :release_status,        null: false, default: false
      t.timestamps
    end
  end
end
