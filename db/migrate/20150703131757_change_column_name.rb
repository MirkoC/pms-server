class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :surfaces, :surface_no, :surface_number
  end
end
