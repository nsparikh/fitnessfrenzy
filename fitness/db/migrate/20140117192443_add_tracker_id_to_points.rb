class AddTrackerIdToPoints < ActiveRecord::Migration
  def change
  	add_column :points, :tracker_id, :integer
  end
end
