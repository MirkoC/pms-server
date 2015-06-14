require 'sequel'

Sequel.migration do
  up do
    # Create contact table
    create_table(:contacts) do
      primary_key :id
      String :name, :null => false
      String :street_address, :null => false
      String :city, :null => false
      String :state, :null => true
      String :country, :null => false
      String :postal_code, :null => false
    end
  end
  down do
    # This is the first migration, so downgrade is to drop table
    drop_table(:contacts)
  end
end