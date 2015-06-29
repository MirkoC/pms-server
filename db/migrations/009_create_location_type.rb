require 'sequel'

Sequel.migration do
  up do
    create_table(:location_types) do
      primary_key :id
      String :name, :null => false
    end
  end
  down do
    drop_table(:location_types)
  end
end