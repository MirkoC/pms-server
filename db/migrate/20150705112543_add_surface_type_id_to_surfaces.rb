class AddSurfaceTypeIdToSurfaces < ActiveRecord::Migration
  def self.up
    change_table :surfaces do |t|
      t.references :surface_type, index: true, foreign_key: true
    end
  end

  def self.down
    change_table :surfaces do |t|
      t.remove_references :surfaces, :surface_type, index: true, foreign_key: true
    end
  end
end
