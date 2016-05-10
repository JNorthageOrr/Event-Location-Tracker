class DropUsertags < ActiveRecord::Migration
  def change
  	drop_table :usertags do |t|
    	t.integer  "user_id"
    	t.integer  "tag_id"
    	t.datetime "created_at", null: false
    	t.datetime "updated_at", null: false
    	remove_index "usertags", ["tag_id"], name: "index_usertags_on_tag_id", using: :btree
 		remove_index "usertags", ["user_id"], name: "index_usertags_on_user_id", using: :btree	
  	end
  end

end
