require 'sequel'
require 'byebug'

Sequel.migration do
  up do
    alter_table(:contacts) do
      add_column :created_at, DateTime, :null => true
      add_column :updated_at, DateTime, :null => false
    end
  end
  down do
    alter_table(:contacts) do
      drop_column(:created_at)
      drop_column(:updated_at)
    end
  end
end