
class BaseLineMigration < ActiveRecord::Migration

  def up
    create_table "contestant_entries", :force => true do |t|
      t.integer  "contestant_id"
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.string   "photo_file_size"
      t.datetime "photo_update_at"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "photographer"
      t.string   "location"
      t.string   "contest_source"
      t.string   "phone"
      t.integer  "rating"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "address"
      t.string   "city"
      t.string   "zip"
      t.string   "state"
      t.boolean  "agreed_to_rules"
    end
  
    create_table "contestants", :force => true do |t|
      t.string   "email"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end

  def down
    drop table "contestants", :force => true
    drop table "contestant_entries", :force => true
  end
  

end
