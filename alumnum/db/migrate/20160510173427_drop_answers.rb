class DropAnswers < ActiveRecord::Migration
  def change
  	drop_table "answers", force: :cascade do |t|
    t.text     "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "profile_id"
    remove_index "answers", ["profile_id"], name: "index_answers_on_profile_id", using: :btree
  	remove_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  	end
  end
end
