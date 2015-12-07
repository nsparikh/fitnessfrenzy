class ChangeTrackersForTemplates < ActiveRecord::Migration
  def change
  	add_column :trackers, :type, :string
  	add_column :points, :aux_data, :float
  	change_column :points, :data, :float
  end
end
