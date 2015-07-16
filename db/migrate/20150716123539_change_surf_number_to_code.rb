class ChangeSurfNumberToCode < ActiveRecord::Migration
  def change
    rename_column :surfaces, :surface_number, :code
  end
end
