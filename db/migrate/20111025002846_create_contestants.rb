class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.string :first_name
      t.string :last_name
      t.string :address 
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :photographer
      t.string :location
      t.string :contest_source
      t.timestamps
    end
  end
end
