class CreateSurfaceTypes < ActiveRecord::Migration
  def change
    create_table :surface_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
