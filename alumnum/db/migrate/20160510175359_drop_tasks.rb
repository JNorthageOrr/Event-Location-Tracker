class DropTasks < ActiveRecord::Migration
  def change
  	drop_table "tasks" do |t|
    	t.string   "title"
    	t.text     "note"
    	t.datetime "created_at", null: false
    	t.datetime "updated_at", null: false
  	end
  end
end
