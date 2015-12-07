class AddAuxColumnsToTrackers < ActiveRecord::Migration
  def change
  	change_column :trackers, :goal, :float
  	add_column :trackers, :aux_goal, :float
  	add_column :trackers, :aux_units, :string
  end
end
