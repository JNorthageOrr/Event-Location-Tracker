class DropResumeItems < ActiveRecord::Migration
  def change
  	drop_table "resume_items" do |t|
    t.string   "title"
    t.string   "heading"
    t.string   "start_date"
    t.string   "end_date"
    t.text     "description"
    t.string   "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  	remove_index "resume_items", ["user_id"], name: "index_resume_items_on_user_id", using: :btree
  	end
  end
end
