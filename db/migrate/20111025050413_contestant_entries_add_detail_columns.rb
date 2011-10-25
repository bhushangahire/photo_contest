class ContestantEntriesAddDetailColumns < ActiveRecord::Migration

  def up
    change_table :contestant_entries  do |t|
      t.string :photographer
      t.string :location
      t.string :contest_source
    end    
  end
 
  def down
    remove_column :contestant_entries , :photographer
    remove_column :contestant_entries , :location
    remove_column :contestant_entries , :contest_source
  end
end
