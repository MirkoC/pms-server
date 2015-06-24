require 'sequel'

Sequel.migration do
  up do
    create_table(:surfaces) do
      primary_key :id
      foreign_key :location_id, :locations
      #foreign_key :surface_type_id, :surface_types
      BigDecimal :price, :null => true
      String :surface_no, :null => false

    end
  end
  down do
    drop_table(:surfaces)
  end
end