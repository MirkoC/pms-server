class CreatePostingOrders < ActiveRecord::Migration
  def change
    create_table :posting_orders do |t|
      t.datetime :issue_date
      t.string :state
      t.string :code
      t.references :surface, index: true, foreign_key: true
      t.references :poster_worker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
