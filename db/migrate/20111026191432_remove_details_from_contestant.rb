class RemoveDetailsFromContestant < ActiveRecord::Migration
  def up
    begin
      remove_column :contestants, :first_name
      remove_column :contestants, :last_name
      remove_column :contestants, :address
      remove_column :contestants, :city
      remove_column :contestants, :state
      remove_column :contestants, :zip
      remove_column :contestants, :phone
      remove_column :contestants, :photographer
    end
    begin
     add_column :contestant_entries, :first_name, :string
     add_column :contestant_entries, :last_name, :string
     add_column :contestant_entries, :address, :string
     add_column :contestant_entries, :city, :string
     add_column :contestant_entries, :zip, :string
     add_column :contestant_entries, :phone, :string
    end
  end

  def down
    begin
     add_column :contestants, :first_name, :string
     add_column :contestants, :last_name, :string
     add_column :contestants, :address, :string
     add_column :contestants, :city, :string
     add_column :contestants, :state, :string
     add_column :contestants, :zip, :string
     add_column :contestants, :phone, :string
     add_column :contestants, :photographer, :string    
    end
    begin
     remove_column :contestant_entries, :first_name
     remove_column :contestant_entries, :last_name
     remove_column :contestant_entries, :address
     remove_column :contestant_entries, :city
     remove_column :contestant_entries, :state
     remove_column :contestant_entries, :phone
     remove_column :contestant_entries, :zip
    end
  end
end
   