class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    add_column :trackers, :group_id, :integer
  end
end
