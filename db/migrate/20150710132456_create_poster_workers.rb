class CreatePosterWorkers < ActiveRecord::Migration
  def change
    create_table :poster_workers do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
