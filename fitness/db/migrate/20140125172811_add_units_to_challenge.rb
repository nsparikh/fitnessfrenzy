class AddUnitsToChallenge < ActiveRecord::Migration
  def change
  	add_column :challenges, :units, :integer
  end
end
