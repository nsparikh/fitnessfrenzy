class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :title
      t.integer :user_id
      t.string :units
      t.timestamp :start_date
      t.timestamp :end_date
      t.timestamp :frequency

      t.timestamps
    end

    add_index :trackers, [:user_id, :start_date]
  end
end
