class AddIndexToTrackers < ActiveRecord::Migration
  def change
  	add_index :trackers, :updated_at
  end
end
