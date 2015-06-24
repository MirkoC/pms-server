require 'sequel'

Sequel.migration do
  up do
    create_table(:campaigns) do
      primary_key :id
      String :name, :null => false
      Time :start_time, :null => false
      Time :end_time, :null => false
    end
  end
  down do
    drop_table(:campaigns)
  end
end