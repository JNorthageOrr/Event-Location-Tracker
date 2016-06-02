class Modprofile < ActiveRecord::Migration
  def change
  	remove_column :profiles, :headline, :string
  	remove_column :profiles, :bio, :text
  	remove_column :profiles, :view_count, :integer
  	remove_column :profiles, :status, :string
  	remove_column :profiles, :twitter, :string
  	remove_column :profiles, :github, :string
  	remove_column :profiles, :personal_site, :string
  	remove_column :profiles, :linkedin, :string
  end
end

