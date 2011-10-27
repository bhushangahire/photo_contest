class AddStateToContestantEntries < ActiveRecord::Migration
  def change
    add_column :contestant_entries, :state, :string
  end
end
