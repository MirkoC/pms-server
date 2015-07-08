class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :rent_number
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.references :campaign, index: true, foreign_key: true
      t.references :surface, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
