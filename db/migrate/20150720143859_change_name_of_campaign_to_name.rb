class ChangeNameOfCampaignToName < ActiveRecord::Migration
  def change
    rename_column :campaigns, :name_of_campaign, :name
  end
end
