class CreateViewApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :view_applications do |t|
      t.integer :user_id
      t.integer :property_id
      t.boolean :apply_status

      t.timestamps
    end
  end
end
