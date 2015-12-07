class ChangeChallengesUnits < ActiveRecord::Migration
  def change
  	change_column :challenges, :units, :string
  end
end
