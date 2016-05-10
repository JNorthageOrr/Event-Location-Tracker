class DropQuestions < ActiveRecord::Migration
  def change 
  	drop_table "questions" do |t|
    	t.string   "question"
    	t.datetime "created_at", null: false
    	t.datetime "updated_at", null: false
  	end
  end
end
