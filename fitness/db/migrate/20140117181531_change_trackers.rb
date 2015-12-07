class ChangeTrackers < ActiveRecord::Migration
  def change
  	change_column :trackers, :start_date, :date
  	change_column :trackers, :end_date, :date
  end
end
