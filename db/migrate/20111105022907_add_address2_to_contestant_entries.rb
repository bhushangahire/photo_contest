class AddAddress2ToContestantEntries < ActiveRecord::Migration
  def change
    add_column :contestant_entries, :address2, :string
  end
end
