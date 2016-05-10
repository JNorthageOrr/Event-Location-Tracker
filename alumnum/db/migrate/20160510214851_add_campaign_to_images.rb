class AddCampaignToImages < ActiveRecord::Migration
  def change
    add_reference :images, :campaign, index: true, foreign_key: true
  end
end
