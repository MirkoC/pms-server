require 'sequel'

Sequel.migration do
  up do
    alter_table(:locations) do
      add_foreign_key(:location_type_id, :location_types)
    end
    alter_table(:surfaces) do
      add_foreign_key(:surface_type_id, :surface_types)
    end
  end
  down do
    alter_table(:locations) do
      drop_column :location_type_id
    end
    alter_table(:surfaces) do
      drop_column :surface_type_id
    end
  end
end