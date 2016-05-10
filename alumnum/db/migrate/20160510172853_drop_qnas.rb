class DropQnas < ActiveRecord::Migration
  def change
  	drop_table "qnas" do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.text     "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  	remove_index "qnas", ["question_id"], name: "index_qnas_on_question_id", using: :btree
  	remove_index "qnas", ["user_id"], name: "index_qnas_on_user_id", using: :btree
  	end
  end
end
