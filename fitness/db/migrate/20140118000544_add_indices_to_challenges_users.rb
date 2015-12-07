class AddIndicesToChallengesUsers < ActiveRecord::Migration
  def change
  	add_index :challenges_users, [:challenge_id, :user_id]
  end
end
