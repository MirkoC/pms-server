require 'sequel'

Sequel.migration do
  up do
    create_table(:locations) do
      primary_key :id
      #foreign_key :location_type_id, :location_types
      String :name, :null => false
      String :street_address, :null => false
      String :city, :null => false
      String :state, :null => true
      String :region, :null => true
      String :country, :null => false
      String :postal_code, :null => false
    end
  end

  down do
    drop_table(:locations)
  end
end