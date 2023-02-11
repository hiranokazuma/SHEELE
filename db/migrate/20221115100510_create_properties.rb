class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.integer :user_id,                 null: false
      t.integer :kind,                    null: false
      t.integer :right,                   null: false
      t.integer :prefecture,              null: false
      t.string :municipality,             null: false
      t.string :city_block,               null: false
      t.string :address,                  null: false
      t.string :line,                     null: false
      t.string :station,                  null: false
      t.integer :walking_minute,          null: false
      t.float :land_area,                 null: false
      t.float :building_area
      t.integer :price,                   null: false
      t.integer :sell_category,           null: false
      t.string :age
      t.string :structure
      t.integer :location_floor
      t.integer :building_coverage_ratio, null: false
      t.integer :floor_area_ratio,        null: false
      t.string :city_planning
      t.string :use_area
      t.string :legal_restriction
      t.string :road_contact
      t.integer :condition,               null: false
      t.boolean :release_status,          null: false, default: false
      t.text :comment
      t.timestamps
    end
  end
end
