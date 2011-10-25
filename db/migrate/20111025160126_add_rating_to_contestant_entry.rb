class AddRatingToContestantEntry < ActiveRecord::Migration
  def change
    add_column :contestant_entries, :rating, :integer
  end            
end
