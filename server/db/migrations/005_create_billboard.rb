require 'sequel'

Sequel.migration do
  up do
    create_table(:billboards) do
      primary_key :id
      String :location, null => false # how to connect this to other table in db?
      String :price, null => true
      String :rent, null => true
      String :direction, null => false
      String :height, null => false
      String :line, null => false
      String :date_of_setting, null => false
      String :date_of_dismantling, null => true
      String :sales_started, null => true
      String :sales_ended, null => true
      String :taken_off, null => true
      String :taken_until, null => true
      String :remark, null => true
      TrueClass :frame, null => true
      TrueClass :lighted, null => true
      TrueClass :gas_station, null => true
      TrueClass :shopping_centers, null => true
      TrueClass :tram_bus_stop, null => true
      TrueClass :prohibition_of_alcohol, null => true
      TrueClass :prohibition_of_tobacco, null => true
      TrueClass :political_restrictions, null=> true
      TrueClass :other_restrictions, null => true
    end
  end
  down do
    drop_table(:billboards)
  end
end