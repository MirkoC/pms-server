require 'sequel'

Sequel.migration do
  up do
    create_table(:locations) do
      primary_key :id
      String :latitude, null => false
      String :longitude, null => false
      String :name_of_location, null => false
      String :company, null => true
      String :street_address, null => false
      String :city, null => false
      String :state, null => false
      String :region, null => false
      String :country, null => false
      String :contract, null => true
      String :jurisdiction, null => true
      String :billboard_worker, null => true
      String :date_of_permit_expiration, null => true
      TrueClass :electricity_paid
      String :billboards, null => true # how to connect this to other table in db?
    end
  end
  down do
    drop_table(:locations)
  end
end