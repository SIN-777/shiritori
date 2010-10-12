# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101012031850) do

  create_table "ruby_class_habtm_ruby_methods", :force => true do |t|
    t.integer  "ruby_class_id",  :null => false
    t.integer  "ruby_method_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ruby_class_habtm_ruby_methods", ["ruby_class_id"], :name => "index_ruby_class_habtm_ruby_methods_on_ruby_class_id"
  add_index "ruby_class_habtm_ruby_methods", ["ruby_method_id"], :name => "index_ruby_class_habtm_ruby_methods_on_ruby_method_id"

  create_table "ruby_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "ruby_classes", ["deleted_at"], :name => "index_ruby_classes_on_deleted_at"

  create_table "ruby_methods", :force => true do |t|
    t.string   "name"
    t.string   "body"
    t.string   "initial"
    t.string   "terminal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  add_index "ruby_methods", ["deleted_at"], :name => "index_ruby_methods_on_deleted_at"
  add_index "ruby_methods", ["initial"], :name => "index_ruby_methods_on_initial"
  add_index "ruby_methods", ["name"], :name => "index_ruby_methods_on_name"
  add_index "ruby_methods", ["terminal"], :name => "index_ruby_methods_on_terminal"

end
