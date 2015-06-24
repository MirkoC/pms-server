require 'sequel'

Sequel.migration do
  up do
    create_table(:posting_orders) do
      primary_key :id
      foreign_key :surface_id, :surfaces
      foreign_key :poster_worker_id, :poster_workers
      Time :issue_date, :null => false
      String :state, :null => false
      String :posting_order_no, :null => false
    end
  end

  down do
    drop_table(:posting_orders)
  end
end