class DropFollows < ActiveRecord::Migration
  def change
  	drop_table "follows" do |t|
    	t.integer  "user_id"
    	t.integer  "tag_id"
    	t.datetime "created_at", null: false
    	t.datetime "updated_at", null: false
  		remove_index "follows", ["tag_id"], name: "index_follows_on_tag_id", using: :btree
  		remove_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree
  	end
  end
end
