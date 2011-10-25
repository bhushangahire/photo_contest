class RemoveColumnsFromContestant < ActiveRecord::Migration
  def up
    remove_column :contestants, :photgrapher
    remove_column :contestants, :location
    remove_column :contestants, :contest_source
  end

  def down
    add_column :contestants, :contest_source, :string
    add_column :contestants, :location, :string
    add_column :contestants, :photgrapher, :string
  end
end
