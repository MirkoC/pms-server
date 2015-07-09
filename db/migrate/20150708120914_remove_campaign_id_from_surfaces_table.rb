class RemoveCampaignIdFromSurfacesTable < ActiveRecord::Migration
  def change
    change_table :surfaces do |t|
      t.remove_references :campaign
    end
  end
end
