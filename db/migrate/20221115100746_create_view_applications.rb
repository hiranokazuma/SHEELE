class CreateViewApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :view_applications do |t|
      t.integer :user_id
      t.integer :property_id
      t.integer :apply_status,           default: 0

      t.timestamps
    end
  end
end
