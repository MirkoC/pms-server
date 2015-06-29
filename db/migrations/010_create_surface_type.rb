require 'sequel'

Sequel.migration do
  up do
    create_table(:surface_types) do
      primary_key :id
      String :name, :null => false
    end
  end
  down do
    drop_table(:surface_types)
  end
end