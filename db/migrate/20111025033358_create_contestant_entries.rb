class CreateContestantEntries < ActiveRecord::Migration
  def change
    create_table :contestant_entries do |t|
      t.integer :contestant_id
      t.string  :photo_file_name
      t.string  :photo_content_type
      t.string  :photo_file_size
      t.integer  :photo_file_size
      t.datetime :photo_update_at 
      t.timestamps
    end
  end
end


