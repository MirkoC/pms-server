class CreateSurfaces < ActiveRecord::Migration
  def change
    create_table :surfaces do |t|
      t.string :surface_no
      t.decimal :price
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
