class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :region
      t.string :country
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
