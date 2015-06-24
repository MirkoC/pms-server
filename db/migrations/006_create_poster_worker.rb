require 'sequel'

Sequel.migration do
  up do
    create_table(:poster_workers) do
      primary_key :id
      String :name, :null => false
      String :street_address, :null => false
      String :city, :null => false
      String :state, :null => true
      String :country, :null => false
      String :postal_code, :null => false
      String :email, :null => false
      String :phone, :null => false
    end
  end

  down do
    drop_table(:poster_workers)
  end
end