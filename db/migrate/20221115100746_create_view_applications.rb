class CreateViewApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :view_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, nill: false, foreign_key: true
      t.integer :apply_status,  default: 1

      t.timestamps
      t.index [:user_id, :property_id], unique: true
    end
  end
end
