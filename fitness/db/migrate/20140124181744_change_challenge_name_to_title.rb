class ChangeChallengeNameToTitle < ActiveRecord::Migration
  def change
  	rename_column :challenges, :name, :title
  end
end
