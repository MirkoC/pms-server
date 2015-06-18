require 'sequel'

Sequel.migration do
  up do
    alter_table(:contacts) do
      add_column :email, String, :null => true
      add_column :phone, String, :null => true
    end
  end
  down do
    alter_table(:contacts) do
      drop_column(:email)
      drop_column(:phone)
    end
  end
end