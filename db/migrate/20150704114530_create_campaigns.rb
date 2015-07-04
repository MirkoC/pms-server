class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name_of_campaign
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
