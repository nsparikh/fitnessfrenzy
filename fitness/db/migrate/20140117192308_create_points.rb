class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :data

      t.timestamps
    end
    add_index :points, :created_at
  end
end
