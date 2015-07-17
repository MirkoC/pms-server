class ChangeRentTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :rents, :type, :rent_type
  end
end
