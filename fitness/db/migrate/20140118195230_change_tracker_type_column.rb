class ChangeTrackerTypeColumn < ActiveRecord::Migration
  def change
  	remove_column :trackers, :type
  	add_column :trackers, :category, :string
  end
end
