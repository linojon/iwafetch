# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 5) do

  create_table "schedules", :force => true do |t|
    t.string   "service"
    t.string   "terms"
    t.integer  "frequency"
    t.datetime "last_run_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.string   "terms"
    t.text     "body"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page"
    t.string   "service"
  end

end