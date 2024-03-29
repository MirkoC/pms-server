class AddCampaignForeignKeyToSurfaces < ActiveRecord::Migration
  def self.up
    change_table :surfaces do |t|
      t.references :campaign, index: true, foreign_key: true
    end
  end

  def self.down
    change_table :surfaces do |t|
      t.remove_references :surface, :campaign, index: true, foreign_key: true
    end
  end
end
