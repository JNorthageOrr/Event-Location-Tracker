class RemoveFieldsFromCampaign < ActiveRecord::Migration
  def change
    remove_column :campaigns, :image_file_name, :string
    remove_column :campaigns, :image_content_type, :string
    remove_column :campaigns, :image_file_size, :integer
    remove_column :campaigns, :image_updated_at, :datetime
  end
end
