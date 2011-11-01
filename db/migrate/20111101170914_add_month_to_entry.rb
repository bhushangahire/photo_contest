class AddMonthToEntry < ActiveRecord::Migration
  def change
    add_column :contestant_entries, :month_rated_for, :integer
  end
end
