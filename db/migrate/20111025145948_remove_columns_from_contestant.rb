class RemoveColumnsFromContestant < ActiveRecord::Migration
  def up
    remove_column :contestants, :photographer
    remove_column :contestants, :location
    remove_column :contestants, :contest_source
  end

  def down
    add_column :contestants, :contest_source, :string
    add_column :contestants, :location, :string
    add_column :contestants, :photographer, :string
  end
end
