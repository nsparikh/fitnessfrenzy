class AddGoalToTrackers < ActiveRecord::Migration
  def change
  	add_column :trackers, :goal, :integer
  end
end
