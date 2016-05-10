class DropTags < ActiveRecord::Migration
  def change
  	drop_table "tags" do |t|
    	t.string   "skill_tag"
    	t.datetime "created_at", null: false
    	t.datetime "updated_at", null: false
  	end	
  end
end
