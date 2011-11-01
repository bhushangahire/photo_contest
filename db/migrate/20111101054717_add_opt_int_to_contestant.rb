class AddOptIntToContestant < ActiveRecord::Migration
  def change
    add_column :contestants, :opt_in, :boolean
  end
end
