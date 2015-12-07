class AddChallengesUsersJoinTable < ActiveRecord::Migration
  def change
  	create_table :challenges_users, :id => false do |t|
  		t.integer :challenge_id
  		t.integer :user_id
  	end

  	rename_column :trackers, :group_id, :challenge_id
  end
end
